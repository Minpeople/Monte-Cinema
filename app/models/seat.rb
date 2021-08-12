# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :cinema_hall

  code: text 
end
