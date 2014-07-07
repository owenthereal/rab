require "active_support"

module Bower
  class Project < Struct.new(:name, :version, :assets)
    include ActiveSupport::Inflector

    def initialize(*args)
      super(*args)
      self.assets ||= []
    end

    def dir_name
      dasherize(name)
    end

    def rails_assets_dir_name
      @dir_name ||= "rab-#{dir_name}"
    end

    def rails_assets_namespace
      @namespace ||= "Rab#{classify(underscore(name))}"
    end

    def js_assets
      @js_assets ||= Filter::JS.new.filter(assets)
    end

    def css_assets
      @css_assets ||= Filter::CSS.new.filter(assets)
    end

    def font_assets
      @font_assets ||= Filter::Font.new.filter(assets)
    end

    def image_assets
      @image_assets ||= Filter::Image.new.filter(assets)
    end

    def self.import!(src)
      Importer.new(src).import!
    end
  end
end
