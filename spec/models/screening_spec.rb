# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Screening, type: :model do
  subject { build(:screening) }

  context 'date validation' do
    it { is_expected.to validate_presence_of(:date) }
  end

  context 'cinema hall association' do
    it { is_expected.to belong_to(:cinema_hall) }
  end

  context 'movie association' do
    it { is_expected.to belong_to(:movie) }
  end

  context 'tickets association' do
    it { is_expected.to have_many(:tickets) }
  end
end
