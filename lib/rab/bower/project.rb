require "json"

module Bower
  class Project < Struct.new(:name, :version, :assets)
    class Creator
      attr_reader :src

      def initialize(src)
        @src = src
      end

      def create!
        cmd = Bower::Command.new(src)
        cmd.install!
        prj_json = JSON.parse(cmd.list!)
        dep_paths = JSON.parse(cmd.list_paths!)

        cwd = prj_json.fetch("canonicalDir")
        pkg_meta = prj_json.fetch("pkgMeta")
        name = pkg_meta.fetch("name")
        version = pkg_meta.fetch("version")

        prj = Bower::Project.new(name, version, [])
        prj.assets += build_assets(cwd, pkg_meta["main"]) # current
        prj.assets += build_dep_assets(cwd, dep_paths)

        prj
      end

      private

      def build_assets(cwd, paths)
        Array(paths).map do |p|
          full_path(cwd, p)
        end
      end

      def build_dep_assets(cwd, dep_paths)
        dep_paths.map do |_, p|
          build_assets(cwd, p)
        end.flatten
      end

      def full_path(cwd, path)
        File.expand_path File.join(cwd, path)
      end
    end

    def initialize(*args)
      super(*args)
      self.assets ||= []
    end

    def self.create!(src)
      Creator.new(src).create!
    end
  end
end
