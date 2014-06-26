module Gem
  module Writter
    class Version < Template
      def write(dst)
        version_file = File.join(dst, "lib", @project.rails_assets_dir_name, "version.rb")
        write_template("version.rb.erb", version_file)
      end
    end
  end
end
