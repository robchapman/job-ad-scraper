# frozen_string_literal: true

require 'rspec'
require_relative '../job_board_scrapers/linked_in_scraper_service'

describe LinkedInScraperService do
  describe '#call' do
    context 'when calling a dummy url' do
      let(:url) { 'http://example.com' }
      let(:parse_rules) { {} }
      let(:query_params) { {} }
      let(:service) { described_class.new(url, parse_rules, query_params) }

      before do
        allow(HTTParty).to receive(:get).and_return('response')
      end

      it 'calls HTTParty.get with the correct arguments' do
        service.call
        expect(HTTParty).to have_received(:get).with(url, query: query_params)
      end
    end

    # context 'when calling linkedin' do
    #   let(:url) { 'https://www.linkedin.com/jobs' }
    #   let(:parse_rules) { {} }
    #   let(:query_params) { { keywords: 'ruby' } }
    #   let(:service) { described_class.new(url, parse_rules, query_params) }

    #   before do
    #     allow(HTTParty).to receive(:get).and_return('response')
    #   end

    #   it 'calls HTTParty.get with the correct arguments' do
    #     service.call
    #     expect(HTTParty).to have_received(:get).with(url, query: query_params)
    #   end
    # end
  end
end
