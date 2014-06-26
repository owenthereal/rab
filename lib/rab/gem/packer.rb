require "erb"

module Gem
  class Packer
    attr_reader :project

    def initialize(prj)
      @project = prj
    end

    def pack!(dst)
      write_readme(dst)
      write_gemspec(dst)
      write_gemfile(dst)
      write_rakefile(dst)
      write_engine_file(dst)
      write_version_file(dst)
      write_js_assets(dst)
      write_css_assets(dst)
      write_font_assets(dst)
    end

    private

    def write_readme(dst)
      Gem::Writter::Readme.new(@project).write(dst)
    end

    def write_gemspec(dst)
      Gem::Writter::Gemspec.new(@project).write(dst)
    end

    def write_gemfile(dst)
      Gem::Writter::Gemfile.new(@project).write(dst)
    end

    def write_rakefile(dst)
      Gem::Writter::Rakefile.new(@project).write(dst)
    end

    def write_engine_file(dst)
      Gem::Writter::Engine.new(@project).write(dst)
    end

    def write_version_file(dst)
      Gem::Writter::Version.new(@project).write(dst)
    end

    def write_js_assets(dst)
      Gem::Writter::JS.new(@project).write(dst)
    end

    def write_css_assets(dst)
      Gem::Writter::CSS.new(@project).write(dst)
    end

    def write_font_assets(dst)
      Gem::Writter::Font.new(@project).write(dst)
    end
  end
end
