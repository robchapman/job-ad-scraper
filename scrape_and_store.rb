# frozen_string_literal: true

require 'yaml'
require_relative 'job_board_scrapers/linked_in_scraper_service'
require_relative 'store_job_ads_service'

puts 'Loading search definitions...'
search_definitions = YAML.load_file('search_definitions.yml')

puts 'Loading existing job ads...'
existing_job_ads = YAML.load_file('job_ads.yml')

puts 'Scraping job ads...'
job_ads = []
search_definitions[:job_boards].each do |job_board|
  job_board[:searches].each do |search|
    puts "Scraping #{job_board[:name]} for #{search[:title]} jobs..."
    job_ads << LinkedInScraperService.new(
      job_board[:url],
      job_board[:parse_rules],
      search[:query_params],
      existing_job_ads
    ).call
  end
end

puts 'Finished scraping job ads.'

job_ads.flatten!

puts 'Storing job ads...'
StoreJobAdsService.new(job_ads).call
