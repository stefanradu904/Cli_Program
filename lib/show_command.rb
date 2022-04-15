# frozen_string_literal: true

require './lib/ruby_gems_api'

class ShowCommand
  attr_reader :gem_name

  def initialize(gem_name)
    @gem_name = gem_name
  end

  def gem_info
    pp RubyGemsApi.get_gem_info(@gem_name).class
    @gem_info ||= RubyGemsApi.get_gem_info(@gem_name)['info']
  end

end
