# frozen_string_literal: true

class Arguments
  attr_reader :cmd, :parameter

  def initialize(cmd, parameter)
    @cmd = cmd
    @parameter = parameter
  end
end
