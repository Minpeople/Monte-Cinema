# frozen_string_literal: true

module Vouchers
  class GenerateVouchers
    def generate
      @voucher = Voucher.find(params[:id])
      discount = @voucher.discount
      @ticket = Ticket.find(params[:id])
      discount += @ticket.price 
      end
  end
end
