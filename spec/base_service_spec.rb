# frozen_string_literal: true

require 'rspec'
require_relative '../base_service'

describe BaseService do
  it 'raises a NotImplementedError when calling #call' do
    expect { described_class.new.call }.to raise_error(NotImplementedError)
  end
end
