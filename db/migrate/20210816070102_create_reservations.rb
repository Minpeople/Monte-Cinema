# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :screening, null: false, foreign_key: true

      t.timestamps
    end
  end
end
