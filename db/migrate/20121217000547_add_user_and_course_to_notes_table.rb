class AddUserAndCourseToNotesTable < ActiveRecord::Migration
  def change
    add_column :notes, :course_id, :integer
  end
end
