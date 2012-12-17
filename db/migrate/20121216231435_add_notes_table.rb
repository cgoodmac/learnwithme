class AddNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :subject
      t.text :content
      t.timestamps
    end
  end
end
