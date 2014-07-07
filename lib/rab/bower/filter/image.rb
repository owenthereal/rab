module Bower
  module Filter
    class Image
      IMAGE_EXT = [ ".png", ".ico", ".jpg", ".jpeg", ".gif" ]

      def filter(files)
        files.select { |a| IMAGE_EXT.include? File.extname(a) }
      end
    end
  end
end
