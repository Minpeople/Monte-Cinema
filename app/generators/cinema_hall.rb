# frozen_string_literal: true

module Generators
  class CinemaHall
    AVAILABLE_COLUMNS = ('A'..'J')

    def generate_seats(capacity)
      seats = []
      (1..capacity / AVAILABLE_COLUMNS.count).each do |row|
        AVAILABLE_COLUMNS.each { |column| seats.push("#{row}#{column}") }
      end
      seats
    end
  end
end