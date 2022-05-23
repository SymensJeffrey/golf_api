class ChangeThroughToStings < ActiveRecord::Migration[6.1]
  def change
    change_column :scores, :through, :string
  end
end
