# frozen_string_literal: true

require './lib/arguments'
require './lib/build_show_command'
require './lib/cli_help_command'

class Cli
  class << self
    def run(argv)
      arguments = parse(argv)
      case arguments.cmd
      when 'show'
        BuildShowCommand.build(arguments.parameter)
      else
        CliHelpCommand.new
      end
    end

    private

    def parse(argv)
      Arguments.new(argv[0], argv[1])
    end
  end
end
