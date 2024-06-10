# frozen_string_literal: true

require 'yaml'
require 'pry'
require_relative 'job_board_scrapers/linked_in_scraper_service'
require_relative 'job_board_scrapers/indeed_scraper_service'
require_relative 'store_job_ads_service'

puts 'Loading search definitions...'
search_definitions = YAML.load_file('search_definitions.yml')

puts 'Loading existing job ads...'
# existing_job_ads = YAML.load_file('job_ads.yml')
existing_job_ads = {
  'LinkedIn' => []
}

job_ads = []
search_definitions['job_boards'].each do |job_board|
  puts "Scraping #{job_board['name']}..."
  job_ads << LinkedInScraperService.new(
    job_board,
    existing_job_ads[job_board['name']]
  ).call
end

puts 'Finished scraping job ads.'

job_ads.flatten!

puts 'Storing job ads...'
# StoreJobAdsService.new(job_ads).call
