# frozen_string_literal: true

require 'nokogiri'
require 'httparty'

class ScraperService < BaseService
  def initialize(url, parse_rules, query_params)
    super
    @url = url
    @parse_rules = parse_rules
    @query_params = query_params
  end

  def call
    # Retrive the html content of the job board

    # Parse the html content of the job board

    # step through the pages of the job board
  end
end
