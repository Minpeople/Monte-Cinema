# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketDesk, type: :model do
  context 'tickets association' do
    it { is_expected.to have_many(:tickets) }
  end

  context 'users association' do
    it { is_expected.to have_many(:users) }
  end
end
