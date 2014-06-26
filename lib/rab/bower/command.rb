require "open3"

module Bower
  class Command
    attr_reader :cwd

    def initialize(cwd)
      @cwd = cwd
    end

    def install!
      bower(cwd, "install --production --force-latest")
    end

    def list!
      bower(cwd, "list --offline")
    end

    def list_paths!
      bower(cwd, "list --paths --offline")
    end

    private

    def bower(cwd, *command)
      command = "bower #{command.join(' ')} --json"
      command += " --config.interactive=false"
      sh(cwd, command)
    end

    def sh(cwd, *cmd)
      cmd = cmd.join(" ")

      output, error, status =
        Open3.capture3(cmd, :chdir => cwd)

      raise CommandError.new(error, cwd, cmd) unless status.success?

      output
    end
  end
end
