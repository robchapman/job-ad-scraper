# frozen_string_literal: true

require 'nokogiri'
require 'capybara'
require 'selenium-webdriver'
require 'dotenv'
Dotenv.load

require_relative 'base_job_board_scraper_service'

class LinkedInScraperService < BaseJobBoardScraperService
  PARAMATER_SEPARATOR = '&'
  EMAIL_SIGN_IN_BUTTON_ID = 'home-hero-sign-in-cta'
  SIGN_IN_BUTTON_ID = 'sign-in-form__submit-btn'
  RESULTS_COUNT_SELECTOR = '.jobs-search-results-list__subtitle span'
  JOB_AD_LIST_ITEM_SELECTOR = 'li.jobs-search-results__list-item'
  JOB_AD_DESCRIPTION_SELECTOR = '.jobs-description-content__text'
  JOB_AD_ID_SELECTOR = 'job-details-jobs-unified-top-card h1 a'

  attr_reader :url, :login_url, :parse_rules, :searches, :session
  attr_accessor :new_job_ads

  def initialize(job_board_data, existing_job_ads)
    super(job_board_data, existing_job_ads)
    @url = job_board_data['url']
    @login_url = job_board_data['login_url']
    @filters = job_board_data['filters']
    @searches = job_board_data['searches']
    @new_job_ads = []
  end

  def call
    configure_capybara
    login
    searches.each { |search| perform_search(search) }
    new_job_ads
  end

  private

  def configure_capybara
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end

    # Capybara.javascript_driver = :selenium
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10 # seconds
      config.default_driver = :selenium
    end

    @session = Capybara::Session.new(:selenium)
  end

  def login
    session.visit @login_url
    if session.has_css?("[data-test-id=#{EMAIL_SIGN_IN_BUTTON_ID}]")
      session.find("[data-test-id=#{EMAIL_SIGN_IN_BUTTON_ID}]").click
    end
    session.fill_in 'session_key', with: ENV.fetch('LINKEDIN_EMAIL', nil)
    session.fill_in 'session_password', with: ENV.fetch('LINKEDIN_PASSWORD', nil)
    session.find("[data-id=#{SIGN_IN_BUTTON_ID}]").click
  end

  def perform_search(search)
    puts "Performing search: #{search['name']}..."
    search_url = concatenate_url(search['query_params'])
    session.visit search_url
    sleep 2
    result_count = 0
    result_count = session.find(RESULTS_COUNT_SELECTOR).text.to_i if session.has_css?(RESULTS_COUNT_SELECTOR)
    puts "Found #{result_count} results."
    (result_count / 25.0).ceil

    # loop through the pages check through the current page
    # loop through the job ids, scrape and store the job details
  end

  def concatenate_url(query_params)
    url + query_params.map { |key, value| "#{key}=#{value}" }.join(PARAMATER_SEPARATOR)
  end

  def check_through_current_page; end

  def passes_filters?(job_ad_description); end
end
