class ChangeColumninUserTable < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role, from: "client", to: nil
  end
end
