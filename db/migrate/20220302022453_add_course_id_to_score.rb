class AddCourseIdToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :course_id, :integer
  end
end
