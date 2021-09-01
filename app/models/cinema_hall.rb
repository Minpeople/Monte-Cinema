# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity
  has_many :screenings, dependent: :destroy
  has_many :seats, dependent: :destroy
end
