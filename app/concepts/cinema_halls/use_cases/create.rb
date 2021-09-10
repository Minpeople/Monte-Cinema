# frozen_string_literal: true

module CinemaHalls
  module UseCases
    class Create
      def initialize(params:, repository: CinemaHalls::Repository.new)
        @params = params
        @repository = repository
      end

      def call(params:)
        repository.create!(params)
      end

      private
      
      attr_reader :params, :repository
    end
  end
end
