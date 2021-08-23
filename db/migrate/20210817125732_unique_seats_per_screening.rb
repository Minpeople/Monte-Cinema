# frozen_string_literal: true

class UniqueSeatsPerScreening < ActiveRecord::Migration[6.1]
  def change
    add_index :tickets, %i[seat_id screening_id], unique: true
  end
end
