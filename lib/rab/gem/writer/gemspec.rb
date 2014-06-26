module Gem
  module Writter
    class Gemspec < Template
      def write(dst)
        gemspec = File.join(dst, "#{@project.rails_assets_dir_name}.gemspec")
        write_template("gemspec.gemspec.erb", gemspec)
      end
    end
  end
end
