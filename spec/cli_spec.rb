# frozen_string_literal: true

require './cli'
require 'spec_helper'

RSpec.describe Cli do
  describe '.run' do
    subject(:run) { Cli.run(argv) }

    context 'with cmd: unknown' do
      let(:argv) { %w[unknown] }

      it 'returns a help command' do
        result = run
        expect(result).to be_an_instance_of(CliHelpCommand)
      end
    end

    context 'with cmd: show' do
      let(:cmd) { 'show' }

      context 'when parameter gem_name is given' do
        let(:argv) { [cmd, 'httparty'] }

        it 'returns a show command' do
          result = run
          expect(result).to be_an_instance_of(ShowCommand)
        end
      end

      context 'when parameter gem_name is NOT given' do
        let(:argv) { [cmd] }

        it 'returns a help show command' do
          result = run
          expect(result).to be_an_instance_of(ShowHelpCommand)
        end
      end
    end

    context 'with cmd: search' do
      let(:cmd) { 'search' }

      context 'when parameter gem_name is given' do
        let(:argv) { [cmd, 'rspec'] }

        it 'returns a search command' do
          result = run
          expect(result).to be_an_instance_of(SearchCommand)
        end
      end

      context 'when parameter gem_name is NOT given' do
        let(:argv) { [cmd] }

        it 'returns a help show command' do
          result = run
          expect(result).to be_an_instance_of(SearchHelpCommand)
        end
      end
    end
  end
end
