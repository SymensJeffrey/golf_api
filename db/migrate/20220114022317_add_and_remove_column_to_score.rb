class AddAndRemoveColumnToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :tournament_id, :integer
  end
end
