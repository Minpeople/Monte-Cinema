class ChangeUsersRoleDataTypeToInteger < ActiveRecord::Migration[6.1]
  def up
    change_column(:users, :role, :integer, using: "role::integer")
  end

  def down
    change_column(:users, :role, :text, using: "role::text")
  end
end
