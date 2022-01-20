class AddNameToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :name, :string
  end
end
