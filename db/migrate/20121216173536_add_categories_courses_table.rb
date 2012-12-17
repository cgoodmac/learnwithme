class AddCategoriesCoursesTable < ActiveRecord::Migration
  def change
    create_table :categories_courses, :id => false do |t|
      t.integer :category_id
      t.integer :course_id
    end
  end
end
