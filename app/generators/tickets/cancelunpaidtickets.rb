# frozen_string_literal: true

module Tickets
  class CancelUnpaidTickets
    def call
      unpaid_tickets.update_all(status: 'cancelled')
    end

  private

    def unpaid_tickets
      Ticket
        .where(status: 'reserved')
        .where(screening.start_time < (Time.current + 30.minutes).to_s)
    end
  end
end
