# frozen_string_literal: true

class AddMovieToScreenings < ActiveRecord::Migration[6.1]
  def change
    add_reference :screenings, :movie, null: false, foreign_key: true, index:true 
  end
end
