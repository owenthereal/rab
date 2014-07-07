module Bower
  module Filter
    class CSS
      CSS_EXT = [ ".scss", ".less", ".sass", ".css" ]

      def filter(files)
        files.select { |a| CSS_EXT.include? File.extname(a) }
      end
    end
  end
end
