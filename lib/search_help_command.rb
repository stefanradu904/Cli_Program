# frozen_string_literal: true

class SearchHelpCommand
  attr_reader :info

  # frozen_string_literal: true
  def initialize
    @info = "Search command format:\n" \
            "search <gem_name> <OPTIONS>\n"\
            "\nWhere OPTIONS can be:\n"\
            '--recent-first -> sort search results from the most downloaded one to the least downloaded one'
  end
end
