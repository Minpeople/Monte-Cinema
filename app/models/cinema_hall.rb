# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  has_many :screenings, dependent: :destroy
  has_many :seats, dependent: :destroy
end
