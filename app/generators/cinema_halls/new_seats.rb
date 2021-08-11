# frozen_string_literal: true

module CinemaHall
  module Generators
    class NewSeats

      def initialize(repository: CinemaHalls::Repository.new)
        @repository = repository
      end

      def call
        seats = CinemaHalls::Generators::GenerateSeats.new(params[:capacity].to_i).call
        params[:seats] = seats
        repository.create(params)
      end
    end
  end
end
