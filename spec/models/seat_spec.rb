# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seat, type: :model do
  context 'cinema hall association' do
    it { is_expected.to belong_to(:cinema_hall) }
  end
end
