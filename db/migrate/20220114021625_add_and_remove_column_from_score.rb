class AddAndRemoveColumnFromScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :token, :string
    remove_column :scores, :tournament_id, :integer
  end
end
