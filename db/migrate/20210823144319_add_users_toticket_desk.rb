class AddUsersToticketDesk < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :ticket_desk, foreign_key: true
  end
end
