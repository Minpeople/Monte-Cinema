# frozen_string_literal: true

class TicketDesk < ApplicationRecord
  has_many :tickets
  has_many :users

  enum category: {
    online: 0,
    offline: 1
  }
end
