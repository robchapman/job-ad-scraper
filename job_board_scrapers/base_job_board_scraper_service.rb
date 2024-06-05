# frozen_string_literal: true

require_relative '../base_service'

class BaseJobBoardScraperService < BaseService
  attr_reader :search_definition_data, :existing_job_ads

  def initialize(search_definition_data, existing_job_ads)
    super
    @search_definition_data = search_definition_data
    @existing_job_ads = existing_job_ads
  end
end
