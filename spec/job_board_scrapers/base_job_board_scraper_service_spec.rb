# frozen_string_literal: true

require 'rspec'
require_relative '../job_board_scrapers/base_job_board_scraper_service'

describe BaseJobBoardScraperService do
  it 'raises a NotImplementedError when calling #call' do
    expect { described_class.new.call }.to raise_error(NotImplementedError)
  end
end
