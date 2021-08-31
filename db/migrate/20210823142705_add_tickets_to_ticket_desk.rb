class AddTicketsToTicketDesk < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :ticket_desk, foreign_key: true
  end
end
