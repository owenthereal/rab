module Bower
  module Filter
    class JS
      JS_EXT = ".js"

      def filter(files)
        files.select { |a| File.extname(a) == JS_EXT }
      end
    end
  end
end
