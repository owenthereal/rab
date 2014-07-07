module Bower
  module Filter
    class Font
      FONT_EXT = [ ".eot", ".svg", ".ttf", ".woff" ]

      def filter(files)
        files.select { |a| FONT_EXT.include? File.extname(a) }
      end
    end
  end
end
