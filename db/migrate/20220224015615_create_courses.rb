class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :city
      t.integer :hole1_par
      t.integer :hole2_par
      t.integer :hole3_par
      t.integer :hole4_par
      t.integer :hole5_par
      t.integer :hole6_par
      t.integer :hole7_par
      t.integer :hole8_par
      t.integer :hole9_par
      t.integer :front_par
      t.integer :hole10_par
      t.integer :hole11_par
      t.integer :hole12_par
      t.integer :hole13_par
      t.integer :hole14_par
      t.integer :hole15_par
      t.integer :hole16_par
      t.integer :hole17_par
      t.integer :hole18_par
      t.integer :back_par
      t.integer :total_par

      t.timestamps
    end
  end
end
