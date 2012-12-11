class AddCoursesTable < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image
      t.timestamps
    end
  end
end
