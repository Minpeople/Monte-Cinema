class AddCategoriesToTicketDesk < ActiveRecord::Migration[6.1]
  def change
    add_column :ticket_desks, :category, :string
  end
end
