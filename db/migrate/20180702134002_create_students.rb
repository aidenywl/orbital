class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :education_level
      t.string :dob
      t.string :past_competitions

      t.timestamps
    end
  end
end
