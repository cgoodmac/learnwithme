class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :zip
      t.string :image
      t.string :is_admin
      t.string :is_teacher
      t.string :is_pro
      t.text :description
      t.timestamps
    end
  end
end
