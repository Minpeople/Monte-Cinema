# frozen_string_literal: true

<<<<<<< HEAD
module CinemaHall
  module Generators
    class GenerateSeats
      AVAILABLE_COLUMNS = ('A'..'J')

      def generate_seats(capacity)
        (1..capacity / AVAILABLE_COLUMNS.count).to_a.product(AVAILABLE_COLUMNS.to_a).map(&:join)
      end
    end
=======
module CinemaHalls
  class GenerateSeats
    AVAILABLE_COLUMNS = ('A'..'J')

  def generate_seats(capacity) 
    (1..capacity / AVAILABLE_COLUMNS.count).to_a.product(AVAILABLE_COLUMNS.to_a).map(&:join)
>>>>>>> 84f6e12 (Updated feature seats as model')
  end
end
