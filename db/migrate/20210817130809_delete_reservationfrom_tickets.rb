# frozen_string_literal: true

class DeleteReservationfromTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :reservation_id, :integer
  end
end
