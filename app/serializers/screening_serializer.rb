# frozen_string_literal: true

class ScreeningSerializer
  include JSONAPI::Serializer
  attributes :date
  has_one :cinema_hall
end
