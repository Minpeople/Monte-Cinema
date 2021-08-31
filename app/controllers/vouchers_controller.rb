# frozen_string_literal: true

class VouchersController < ApplicationController
  def index
    @vouchers = current_user.vouchers
    render json: @vouchers
  end

  def show
    @voucher = current_user.vouchers.find(params[:id])
    render json: @voucher
  end

  def create
    @voucher = Voucher.new(voucher_params)

    if @voucher.save
      render json: @voucher,
             status: :created
    else
      render json: @voucher,
             status: :unprocessable_entity
    end
  end
  
  def upgrade
    voucher = current_user.voucher.find(params[:id])
    voucher = Vouchers::GenerateDiscount.new.discount(voucher_id, ticket_id)
  end

  def update
    @voucher = current_user.vouchers.find(params[:id])
    if @voucher.update(voucher_params)
      render json: :show, status: :ok
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @voucher = current_user.voucher
    @voucher.destroy

    head :no_content
  end

  private

  def voucher_params
    params.require(:voucher).permit(:discount)
  end
end
