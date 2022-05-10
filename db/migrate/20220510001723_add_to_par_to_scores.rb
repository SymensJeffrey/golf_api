class AddToParToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :to_par, :string
  end
end
