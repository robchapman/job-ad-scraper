# frozen_string_literal: true

require 'rspec'
require_relative '../../job_board_scrapers/base_job_board_scraper_service'

describe BaseJobBoardScraperService do
  let(:search_definition_data) { {} }
  let(:existing_job_ads) { [] }

  it 'raises a NotImplementedError when calling #call' do
    expect { described_class.call(search_definition_data, existing_job_ads) }.to raise_error(NotImplementedError)
  end

  it 'has a search_definition_data attribute' do
    service = described_class.new(search_definition_data, existing_job_ads)
    expect(service.search_definition_data).to eq(search_definition_data)
  end

  it 'has an existing_job_ads attribute' do
    service = described_class.new(search_definition_data, existing_job_ads)
    expect(service.existing_job_ads).to eq(existing_job_ads)
  end
end
