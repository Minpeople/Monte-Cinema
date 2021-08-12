class DeleteSeatsFromHall < ActiveRecord::Migration[6.1]
  def change
    remove_column :cinema_halls, :seats, :text
  end
end
