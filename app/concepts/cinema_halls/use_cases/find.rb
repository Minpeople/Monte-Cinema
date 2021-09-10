# frozen_string_literal: true

module CinemaHalls
  module UseCases
    class Find
      def initialize(repository: CinemaHalls::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.find(id)
      end

      private

      attr_reader :repository
    end
  end
end
