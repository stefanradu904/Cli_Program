# frozen_string_literal: true

class CliHelpCommand
  attr_reader :info

  # frozen_string_literal: true
  def initialize
    @info = "CLI Program supported commands:\n"\
            'show <gem_name> - display the details of the gem specified by gem_name parameter'
  end
end
