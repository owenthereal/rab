module Gem
  module Writter
    class Readme < Template
      def write(dst)
        readme = File.join(dst, "README.md")
        write_template("README.md.erb", readme)
      end
    end
  end
end
