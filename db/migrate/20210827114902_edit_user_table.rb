class EditUserTable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :vouchers, :user_id, false
  end
end
