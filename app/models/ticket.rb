# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :screening
  STATUS = %w[pending reserved cancelled paid].freeze
  TYPES = %w[adult child student senior].freeze
end
