# frozen_string_literal: true

require './lib/search_command'

RSpec.describe SearchCommand do
  describe('#search_results') do
    context 'when option: --most-downloads-first is given' do
      subject(:search_command) { SearchCommand.new(gem_name, search_options) }

      let(:gem_name) { 'rspec' }
      let(:search_options) { ['--most-downloads-first'] }
      let(:rand_downloads) { rand(100) }
      it 'contains search_results names sorted' do
        stub_request(:get, /rubygems.org/)
          .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
          .to_return(
            status: 200,
            body: [{ name: 'rspec1', downloads: rand_downloads },
                   { name: 'rspec2', downloads: rand_downloads },
                   { name: 'rspec3', downloads: rand_downloads },
                   { name: 'rspec4', downloads: rand_downloads },
                   { name: 'rspec5', downloads: rand_downloads },
                   { name: 'rspec6', downloads: rand_downloads }].to_json,
            headers: { 'Content-Type' => 'application/json' }
          )

        expect(search_command.gem_name).to eq gem_name
        expect(search_command.search_options).to eq search_options
        expect(search_command.search_results).to be_an_instance_of(Array)
        expect(search_command.search_results).to eq(
                                                   RubyGemsApi.get_search_results(gem_name)
                                                              .sort_by { |gem| -gem['downloads'] }
                                                              .map { |gem| gem['name'] }
                                                 )
      end
    end

    context 'when options are NOT given' do
      subject(:search_command) { SearchCommand.new(gem_name) }

      let(:gem_name) { 'rspec' }
      it 'contains search_results names' do
        stub_request(:get, /rubygems.org/)
          .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
          .to_return(
            status: 200,
            body: [{ name: 'rspec1' },
                   { name: 'rspec2' },
                   { name: 'rspec3' },
                   { name: 'rspec4' },
                   { name: 'rspec5' },
                   { name: 'rspec6' }].to_json,
            headers: { 'Content-Type' => 'application/json' }
          )

        expect(search_command.gem_name).to eq gem_name
        expect(search_command.search_options).to eq []
        expect(search_command.search_results).to be_an_instance_of(Array)
        expect(search_command.search_results).to eq(RubyGemsApi.get_search_results(gem_name).map { |gem| gem['name'] })
      end
    end
  end
end
