class AddEbooksTable < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :image
      t.timestamps
    end
  end
end
