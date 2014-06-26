module Gem
  module Writter
    class JS < Asset
      def write(dst)
        return if @project.js_assets.empty?

        js_dir = File.join(dst, "vendor", "assets", "javascripts")
        write_assets(js_dir, @project.js_assets)

        manifest_file = File.join(js_dir, "#{@project.dir_name}.js")
        write_template("js_manifest.js.erb", manifest_file)
      end
    end
  end
end
