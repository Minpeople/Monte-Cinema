# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@wp.pl' }
    password { 'qwe1234' }
  end
  FactoryBot.build(:user, :client)
  FactoryBot.build(:user, :admin)
end
