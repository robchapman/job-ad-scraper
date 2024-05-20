# frozen_string_literal: true

require 'nokogiri'
require 'capybara'
require 'selenium-webdriver'
require_relative 'base_scraper_service'

class LinkedInScraperService < BaseScraperService
  def initialize(url, parse_rules, query_params, existing_job_ads)
    super
    @url = url
    @parse_rules = parse_rules
    @query_params = query_params
  end

  def call
    # create capyarba session and login

    # visit the job board

    # get number of results and therefore number of pages

    # loop through the pages and scrape the job as ids

    # loop through the job ids, scrape and store the job details
  end

  private

  def configure_capybara
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end

    Capybara.javascript_driver = :selenium
  end

  def login; end
end
