# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CinemaHall, type: :model do
  subject { build(:cinema_hall) }

  context 'name validation' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'capacity validation' do
    it { is_expected.to validate_presence_of(:capacity) }
  end

  context 'screenings association' do
    it { is_expected.to have_many(:screenings) }
  end

  context 'seats association' do
    it { is_expected.to have_many(:seats) }
  end
end
