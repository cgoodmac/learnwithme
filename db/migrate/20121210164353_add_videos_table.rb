class AddVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :image
      t.timestamps
    end
  end
end
