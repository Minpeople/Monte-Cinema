# frozen_string_literal: true

class AddTicketsToScreening < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :screening, foreign_key: true
  end
end
