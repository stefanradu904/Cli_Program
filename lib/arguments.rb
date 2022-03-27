class Arguments
  attr_reader :cmd
  attr_reader :attribute

  def initialize(cmd, attribute)
    @cmd = cmd
    @attribute = attribute
  end
end