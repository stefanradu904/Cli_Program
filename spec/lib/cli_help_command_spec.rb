# frozen_string_literal: true

require './lib/cli_help_command'

RSpec.describe CliHelpCommand do
  subject(:cli_help_command) { CliHelpCommand.new }

  it 'contains help info for CLI program' do
    help_info = "CLI Program supported commands:\n"\
                'show <gem_name> - display the details of the gem specified by gem_name parameter'
    expect(cli_help_command.info).to eq help_info
  end
end
