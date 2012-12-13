class AddCoursesEbooksTable < ActiveRecord::Migration
  def change
    create_table :courses_ebooks, :id => false do |t|
      t.integer :course_id
      t.integer :ebook_id
    end
  end
end
