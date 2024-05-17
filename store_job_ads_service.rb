# frozen_string_literal: true

require 'google_drive'

class StoreJobAdsService < BaseService
  def initialize(job_ads)
    super
    @job_ads = job_ads
  end

  def call
    puts job_ads
    # Read existing job postings from google sheet

    # Compare the new job postings with the existing job postings

    # Add new job postings to the google sheet
  end
end
