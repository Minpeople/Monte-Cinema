# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Voucher, type: :model do
  context 'user association' do
    it { is_expected.to belong_to(:user) }
  end
end
