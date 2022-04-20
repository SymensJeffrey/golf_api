class AddPasswordResetColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_reset_sent_at
    remove_column :users, :password_reset_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :reset_password_token
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end
