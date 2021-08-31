class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers do |t|
      t.integer :discount

      t.timestamps
    end
  end
end
