# frozen_string_literal: true

class ChangeColumnTitleAndDurationInTableMovies < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:movies, :title, false)
    change_column_null(:movies, :duration, false)
  end
end
