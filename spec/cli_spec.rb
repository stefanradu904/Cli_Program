# frozen_string_literal: true

require './cli'

RSpec.describe Cli do
  describe '.run' do
    subject(:run) { Cli.run(argv) }

    context 'with cmd: unknown' do
      let(:argv) { %w[unknown] }

      it 'returns a help command' do
        result = run
        expect(result).to be_an_instance_of(CliHelpCommand)
        expect(result.info).to include('CLI Program supported commands:')
      end
    end

    context 'with cmd: show' do
      let(:cmd) { 'show' }

      context 'when parameter [gem_name] is given' do
        let(:argv) { [cmd, 'httparty'] }

        it 'returns a show command' do
          result = run
          expect(result).to be_an_instance_of(ShowCommand)
          expect(result.gem_name).to eq 'httparty'
          expect(result.gem_info).to eq 'Makes http fun! Also, makes consuming restful web services dead easy.'
        end
      end

      context 'when parameter [gem_name] is NOT given' do
        let(:argv) { [cmd] }

        it 'returns a help show command' do
          result = run
          expect(result).to be_an_instance_of(ShowHelpCommand)
          expect(result.info).to include('Show command format:')
        end
      end
    end
  end
end
