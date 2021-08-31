# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {
    client: 0,
    admin: 1
  }
  belongs_to :ticket_desk, optional: true
  has_many :tickets
  has_many :vouchers
end
