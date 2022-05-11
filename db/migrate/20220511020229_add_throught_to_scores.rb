class AddThroughtToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :through, :integer
  end
end
