module Gem
  module Writter
    class Engine < Template
      def write(dst)
        engine_file = File.join(dst, "lib", "#{@project.rails_assets_dir_name}.rb")
        write_template("engine.rb.erb", engine_file)
      end
    end
  end
end
