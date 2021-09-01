# frozen_string_literal: true

class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :duration
  has_many :screenings
end
