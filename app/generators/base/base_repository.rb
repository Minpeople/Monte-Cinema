# frozen_string_literal: true

module Base
  class BaseRepository
    attr_reader :adapter

    def initialize(adapter:)
      @adapter = adapter
    end

    def create(params)
      adapter.create(params)
    end

    def delete(id)
      adapter.destroy(id)
    end
  end
end
