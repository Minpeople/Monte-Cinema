# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.float :price, null: false
      t.integer :type, default: 'regular'
      t.references :reservation, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
