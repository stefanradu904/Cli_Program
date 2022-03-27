require 'spec_helper'
require './cli'

RSpec.describe Cli do
  describe '.run' do
    subject(:cmd) { Cli.run(argv) }

    context 'cmd: unknown' do
      let(:argv) { %w[unknown] }

      it "returns a help command" do
        result = cmd
        expect(result).to be_an_instance_of(CliHelpCommand)
        expect(result.info).to include("CLI Program supported commands:")
      end
    end

    context 'cmd: show + attribute' do
      let(:argv) { %w[show httparty] }

      it "returns a show command" do
        result = cmd
        expect(result).to be_an_instance_of(ShowCommand)
        expect(result.gem_name).to eq "httparty"
        expect(result.gem_info).to eq "Makes http fun! Also, makes consuming restful web services dead easy."
      end
    end

    context 'cmd: show + no attribute' do
      let(:argv) { %w[show] }
      it "returns a help show command" do
        result = cmd
        expect(result).to be_an_instance_of(ShowHelpCommand)
        expect(result.info).to include("Show command format:")
      end
    end
  end
end