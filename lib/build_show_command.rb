require 'show_help_command'
require 'show_command'

module BuildShowCommand
  def self.build(attribute)
    return ShowHelpCommand.new() if attribute.nil?

    ShowCommand.new(attribute)
  end
end