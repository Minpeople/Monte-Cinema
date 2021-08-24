# frozen_string_literal: true

class TicketDesk < ApplicationRecord
  has_many :tickets
  has_many :users
end
