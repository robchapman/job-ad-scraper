# frozen_string_literal: true

class BaseService
  def self.call(*)
    new.call(*)
  end

  def initialize(*_args) end

  def call
    raise NotImplementedError
  end
end
