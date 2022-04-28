class FixUserIssue2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_reset_sent_at
  end
end
