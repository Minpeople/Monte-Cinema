# frozen_string_literal: true

FactoryBot.define do
  factory :screening do
    date { '2022-02-02 01:00:00' }
    cinema_hall_id { 1 }
    movie_id { 1 }
  end
end
