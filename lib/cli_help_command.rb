class CliHelpCommand
  attr_reader :info

  def initialize
    @info = "CLI Program supported commands:\n"
    @info += "show <gem_name> - display the details of the gem specified by gem_name attribute"
  end
end
