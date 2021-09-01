# frozen_string_literal: true

class Screening < ApplicationRecord
  validates_presence_of :date
  belongs_to :cinema_hall
  belongs_to :movie
  has_many :tickets
end
