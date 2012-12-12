class AddCoursesVideosTable < ActiveRecord::Migration
  def change
    create_table :courses_videos, :id => false do |t|
      t.integer :course_id
      t.integer :video_id
    end
  end
end
