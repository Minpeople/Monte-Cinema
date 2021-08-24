# frozen_string_literal: true

class VouchersController < ApplicationController
  before_action :only => [:show] do
    redirect_to new_user_session_path unless current_user && current_user.role('admin)')
  end
  
  def index
    @vouchers = Voucher.all
    render json: @vouchers
  end

  def show
    @voucher = Voucher.find(params[:id])
    render json: @voucher
  end

  def create
    @voucher = Voucher.new(voucher_params)

    if @voucher.save
      render json: @voucher
              status: :created
    else
      render json: @voucher
      status: :unprocessable_entity
    end
  end

  def update
    @voucher = Voucher.find(params[:id])
    if @voucher.update(voucher_params)
      render json: :show, status: :ok
    else
      render json: @voucher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @voucher = Voucher.find(params[:id])
    @voucher.destroy

    head :no_content
  end

  private

  def voucher_params
    params.require(:voucher).permit(:discount)
  end
end
  