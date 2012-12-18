class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event
      t.integer :user_id
      t.integer :course_id
      t.integer :note_id
      t.timestamps
    end
  end
end
