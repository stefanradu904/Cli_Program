# frozen_string_literal: true

class ShowHelpCommand
  attr_reader :info

  # frozen_string_literal: true
  def initialize
    @info = "Show command format:\n" \
            'show <gem_name>'
  end
end
