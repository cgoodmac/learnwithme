class AddAudiosTable < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.string :audio_file
      t.timestamps
    end
  end
end
