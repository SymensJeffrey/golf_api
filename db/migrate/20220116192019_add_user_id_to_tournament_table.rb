class AddUserIdToTournamentTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :user_id, :integer
  end
end
