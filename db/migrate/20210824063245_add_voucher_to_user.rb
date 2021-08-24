class AddVoucherToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :vouchers, :user, foreign_key: true
  end
end
