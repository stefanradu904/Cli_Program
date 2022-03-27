require './lib/ruby_gems_api'

class ShowCommand
  attr_reader :gem_name
  attr_reader :gem_info

  def initialize(gem_name)
    @gem_name = gem_name
    @gem_info = RubyGemsApi.get_gem_info(gem_name)
  end
end
