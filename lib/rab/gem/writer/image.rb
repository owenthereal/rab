module Gem
  module Writter
    class Image < Asset
      def write(dst)
        return if @project.image_assets.empty?

        image_dir = File.join(dst, "vendor", "assets", "images")
        write_assets(image_dir, @project.image_assets)
      end
    end
  end
end
