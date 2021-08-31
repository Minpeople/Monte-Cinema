# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  context 'title validation' do
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'duration validation' do
    it { is_expected.to validate_presence_of(:duration) }
  end

  context 'screenings association' do
    it { is_expected.to have_many(:screenings) }
  end
end
