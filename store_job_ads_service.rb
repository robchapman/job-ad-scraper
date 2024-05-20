# frozen_string_literal: true

require 'google_drive'
require_relative 'base_service'

class StoreJobAdsService < BaseService
  def initialize(job_ads)
    super
    @job_ads = job_ads
  end

  def call
    puts job_ads
    # Add new job postings to the google sheet
  end
end
