# frozen_string_literal: true

require './lib/ruby_gems_api'

class SearchCommand
  attr_reader :gem_name, :search_options

  def initialize(gem_name, search_options = [])
    @gem_name = gem_name
    @search_options = search_options
  end

  def search_results
    @search_results ||= if @search_options.include? '--most-downloads-first'
                          RubyGemsApi.get_search_results(@gem_name)
                                     .sort_by { |gem| -gem['downloads'] }
                                     .map { |gem| gem['name'] }
                        else
                          RubyGemsApi.get_search_results(@gem_name).map { |gem| gem['name'] }
                        end
  end
end
