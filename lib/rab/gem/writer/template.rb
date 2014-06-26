module Gem
  module Writter
    class Template
      def initialize(project)
        @project = project
      end

      protected

      def write_template(template_name, to_file)
        FileUtils.mkdir_p File.dirname(to_file)
        template = ERB.new File.read(template(template_name)), nil, "-"
        File.open(to_file, "w") { |f| f.write template.result(binding) }
      end

      def template(name)
        File.expand_path File.join(File.dirname(__FILE__), "..", "templates", name)
      end
    end
  end
end
