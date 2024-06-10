# frozen_string_literal: true

require 'rspec'
require 'capybara'
require_relative '../../../job_board_scrapers/linked_in_scraper_service'

RSpec.describe 'LinkedInScraperService' do
  let(:search_definition_data) do
    {
      name: 'LinkedIn',
      url: 'https://www.linkedin.com/search/results/people/?keywords={{query}}',
      login_url: 'https://www.linkedin.com',
      paramater_separator: '&',
      parse_rules: [
        { name: 'list', selector: 'test' },
        { name: 'results_count', selector: 'test' },
        { name: 'job_ad', selector: 'test' }
      ],
      filters: [
        { type: 'must_contain', value: 'ruby' }
      ],
      query_params: {},
      searches: [
        {
          name: 'Full Stack Developer - In London - Full/Contract - past day',
          query_params: {
            f_JT: 'F%2CC', # Full-time, Contract
            f_PP: '100495523', # In London
            f_TPR: 'd86400', # Past day
            f_WT: '3%2C1', # Onsite, Hybrid
            keywords: 'full%20stack%20developer', # Full Stack Developer
            refresh: 'true', # Refresh the search?
            start: 0 # Start at the first page
          }
        }
      ]
    }
  end
  let(:existing_job_ads) { [] }
  let(:service) { LinkedInScraperService.new(search_definition_data, existing_job_ads) }

  before do
    allow(ENV).to receive(:fetch).with('LINKEDIN_EMAIL').and_return('test_email')
    allow(ENV).to receive(:fetch).with('LINKEDIN_PASSWORD').and_return('test_password')
  end

  describe '#call' do
    it 'returns an array of job ads' do
      expect(service.call).to be_an_instance_of(Array)
    end
  end
end
