class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :current_audio

      t.timestamps
    end
  end
end
