module Gem
  module Writter
    class Font < Asset
      def write(dst)
        return if @project.font_assets.empty?

        font_dir = File.join(dst, "vendor", "assets", "fonts")
        write_assets(font_dir, @project.font_assets)
      end
    end
  end
end
