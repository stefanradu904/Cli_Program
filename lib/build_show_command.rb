# frozen_string_literal: true

require 'show_help_command'
require 'show_command'

module BuildShowCommand
  def self.build(parameter)
    parameter.nil? ? ShowHelpCommand.new : ShowCommand.new(parameter)
  end
end
