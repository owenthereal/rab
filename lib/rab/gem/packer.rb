require "erb"

module Gem
  class Packer
    attr_reader :project

    def initialize(prj)
      @project = prj
    end

    def pack!(dst)
      write_gemspec(dst)
      write_gemfile(dst)
      write_rakefile(dst)
      write_lib_file(dst)
      write_version_file(dst)
      write_js_assets(dst)
      write_css_assets(dst)
      write_font_assets(dst)
    end

    private

    def write_gemspec(dst)
      gemspec = File.join(dst, "#{@project.rails_assets_dir_name}.gemspec")
      write_template("gemspec.gemspec.erb", gemspec)
    end

    def write_gemfile(dst)
      gemfile = File.join(dst, "Gemfile")
      write_template("Gemfile.erb", gemfile)
    end

    def write_rakefile(dst)
      rakefile = File.join(dst, "Rakefile")
      write_template("Rakefile.erb", rakefile)
    end

    def write_lib_file(dst)
      lib_file = File.join(dst, "lib", "#{@project.rails_assets_dir_name}.rb")
      write_template("lib.rb.erb", lib_file)
    end

    def write_version_file(dst)
      version_file = File.join(dst, "lib", @project.rails_assets_dir_name, "version.rb")
      write_template("version.rb.erb", version_file)
    end

    def write_template(name, to_file)
      FileUtils.mkdir_p File.dirname(to_file)
      template = ERB.new File.read(template(name))
      File.open(to_file, "w") { |f| f.write template.result(binding) }
    end

    def write_js_assets(dst)
      js_dir = File.join(dst, "vendor", "assets", "javascripts")
      write_assets(js_dir, @project.js_assets)
    end

    def write_css_assets(dst)
      css_dir = File.join(dst, "vendor", "assets", "stylesheets")
      write_assets(css_dir, @project.css_assets)
    end

    def write_font_assets(dst)
      font_dir = File.join(dst, "vendor", "assets", "fonts")
      write_assets(font_dir, @project.font_assets)
    end

    def write_assets(dir, assets)
      asset_dir = File.join(dir, @project.rails_assets_dir_name)
      FileUtils.mkdir_p(asset_dir)
      assets.each { |a| FileUtils.cp a, File.join(asset_dir, File.basename(a)) }
    end

    def template(name)
      File.expand_path File.join(File.dirname(__FILE__), "templates", name)
    end
  end
end
