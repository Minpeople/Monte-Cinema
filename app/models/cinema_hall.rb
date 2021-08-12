# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  has_many :screenings, dependent: :destroy
<<<<<<< HEAD
=======
  has_many :seats, dependent: destroy
>>>>>>> 84f6e12 (Updated feature seats as model')
end
