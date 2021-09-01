# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'tickets association' do
    it { is_expected.to have_many(:tickets) }
  end

  context 'vouchers association' do
    it { is_expected.to have_many(:vouchers) }
  end

  context 'ticket desk association' do
    it { is_expected.to belong_to(:ticket_desk).optional }
  end

  context 'role validation' do
    it do
      expect(subject).to define_enum_for(:role).with_values(
        %i[
          client
          admin
        ]
      )
    end
  end
end
