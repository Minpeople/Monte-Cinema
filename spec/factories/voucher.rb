# frozen_string_literal: true

FactoryBot.define do
  factory :voucher do
    discount { 2 }
    user_id { 1 }
  end
end
