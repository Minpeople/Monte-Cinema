# frozen_string_literal: true

module CinemaHall
  module Generators
    class GenerateSeats
      AVAILABLE_COLUMNS = ('A'..'J')

      def generate_seats(capacity)
        (1..capacity / AVAILABLE_COLUMNS.count).to_a.product(AVAILABLE_COLUMNS.to_a).map(&:join)
      end
    end
  end
end
