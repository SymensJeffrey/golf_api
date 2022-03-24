class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :users, :role, :string
    end
  end
end
