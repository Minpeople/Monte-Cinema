# frozen_string_literal: true

class AddCodeToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :code, :text
  end
end
