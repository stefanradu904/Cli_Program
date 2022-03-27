class ShowHelpCommand
  attr_reader :info

  def initialize
    @info = "Show command format:\n"
    @info += "show <gem_name>"
  end
end
