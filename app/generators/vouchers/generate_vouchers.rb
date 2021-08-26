# frozen_string_literal: true

module Vouchers
  class GenerateVouchers
    def generate(voucher_id, ticket_id)
      @voucher = Voucher.find(voucher_id)
      discount = @voucher.discount
      @ticket = Ticket.find(ticket_id)
      discount += @ticket.price
    end
  end
end
