class AddRoleToUser2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string
  end
end
