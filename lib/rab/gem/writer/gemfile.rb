module Gem
  module Writter
    class Gemfile < Template
      def write(dst)
        gemfile = File.join(dst, "Gemfile")
        write_template("Gemfile.erb", gemfile)
      end
    end
  end
end
