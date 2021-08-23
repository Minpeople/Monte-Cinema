# frozen_string_literal: true

class CinemaHallSerializer
  include JSONAPI::Serializer

  attributes :name, :capacity
  has_many :screenings
end
