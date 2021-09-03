# frozen_string_literal: true

module Movies
  module UseCases
    class Create
      def initialize(params:, repository: Movies::Repository.new)
        @repository = repository
        @params =params
      end

      def call(params:)
        repository.create(params)
      end

      private

      attr_reader :repository, :params
    end
  end
end
