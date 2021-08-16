# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :screening
  belongs_to :user
  STATUS = ['pending', 'reserved', 'cancelled', 'paid'].freeze

end
