# frozen_string_literal: true

require './lib/show_command'
require 'spec_helper'

RSpec.describe ShowCommand do
  describe ('#gem_info') do
    subject(:show_command) { ShowCommand.new(gem_name) }
    let(:gem_name) { 'rspec' }
    let(:gem_info) { 'BDD for Ruby' }

    it 'contains gem_name and gem_info' do
      stub_request(:get, /rubygems.org/)
        .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
        .to_return(
          status: 200,
          body: { name: gem_name, info: gem_info }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )

      expect(show_command.gem_name).to eq gem_name
      expect(show_command.gem_info).to eq gem_info
    end
  end
end
