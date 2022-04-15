# frozen_string_literal: true

require './lib/show_help_command'

RSpec.describe ShowHelpCommand do
  subject(:show_help_command) { ShowHelpCommand.new }

  it 'contains help info for show command' do
    help_info = "Show command format:\n" \
                'show <gem_name>'
    expect(show_help_command.info).to eq help_info
  end
end
