class AddColumnToTournament < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :token, :string
  end
end
