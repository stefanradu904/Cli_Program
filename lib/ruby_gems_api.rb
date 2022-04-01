# frozen_string_literal: true

require 'httparty'

class RubyGemsApi
  include HTTParty
  base_uri 'rubygems.org'

  class << self
    def get_gem_info(gem_name)
      get("/api/v1/gems/#{gem_name}.json").parsed_response['info']
    end
  end
end
