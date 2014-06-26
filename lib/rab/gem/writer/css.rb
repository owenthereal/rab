module Gem
  module Writter
    class CSS < Asset
      def write(dst)
        return if @project.css_assets.empty?

        css_dir = File.join(dst, "vendor", "assets", "stylesheets")
        write_assets(css_dir, @project.css_assets)

        manifest_file = File.join(css_dir, "#{@project.dir_name}.css")
        write_template("css_manifest.css.erb", manifest_file)
      end
    end
  end
end
