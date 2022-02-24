class AddCourseIdToTournaments < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :course_id, :integer
  end
end
