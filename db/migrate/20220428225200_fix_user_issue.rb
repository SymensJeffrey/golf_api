class FixUserIssue < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_reset_sent_at, :string
  end
end
