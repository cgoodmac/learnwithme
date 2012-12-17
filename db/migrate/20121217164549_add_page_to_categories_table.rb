class AddPageToCategoriesTable < ActiveRecord::Migration
  def change
    add_column :categories, :page, :integer
  end
end
