# frozen_string_literal: true

require './lib/search_help_command'

RSpec.describe SearchHelpCommand do
  subject(:search_help_command) { SearchHelpCommand.new }

  it 'contains help info for search command' do
    help_info = "Search command format:\n" \
                "search <gem_name> <OPTIONS>\n"\
                "\nWhere OPTIONS can be:\n"\
                '--recent-first -> sort search results from the most downloaded one to the least downloaded one'
    expect(search_help_command.info).to eq help_info
  end
end
