# frozen_string_literal: true

class RemoveReservationForeignKeyFromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :tickets, :reservations
  end
end
