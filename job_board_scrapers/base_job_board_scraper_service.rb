# frozen_string_literal: true

require_relative '../base_service'

class StoreJobAdsService < BaseService
  def initialize(url, parse_rules, query_params, existing_job_ads)
    super
    @url = url
    @parse_rules = parse_rules
    @query_params = query_params
  end

  def call
    raise NotImplementedError
  end
end
