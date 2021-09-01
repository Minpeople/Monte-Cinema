# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'user association' do
    it { is_expected.to belong_to(:user) }
  end

  context 'screening association' do
    it { is_expected.to belong_to(:screening) }
  end

  context 'ticket desk association' do
    it { is_expected.to belong_to(:ticket_desk) }
  end
end
