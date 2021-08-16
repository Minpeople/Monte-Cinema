# frozen_string_literal: true

class Screening < ApplicationRecord
  belongs_to :cinema_hall
  has_many :reservations
  belongs_to :movie
end
