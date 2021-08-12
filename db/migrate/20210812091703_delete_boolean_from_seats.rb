# frozen_string_literal: true

class DeleteBooleanFromSeats < ActiveRecord::Migration[6.1]
  def change
    remove_column :seats, :reserved, :boolean
  end
end
