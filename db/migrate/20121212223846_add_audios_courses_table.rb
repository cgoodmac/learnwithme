class AddAudiosCoursesTable < ActiveRecord::Migration
  def change
    create_table :audios_courses, :id => false do |t|
      t.integer :audio_id
      t.integer :course_id
    end
  end
end