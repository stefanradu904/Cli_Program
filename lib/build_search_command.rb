# frozen_string_literal: true

require 'search_help_command'
require 'search_command'

module BuildSearchCommand
  def self.build(parameter)
    parameter.nil? ? SearchHelpCommand.new : SearchCommand.new(parameter)
  end
end
