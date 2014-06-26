module Gem
  module Writter
    class Rakefile < Template
      def write(dst)
        rakefile = File.join(dst, "Rakefile")
        write_template("Rakefile.erb", rakefile)
      end
    end
  end
end
