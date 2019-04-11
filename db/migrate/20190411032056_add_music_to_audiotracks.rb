class AddMusicToAudiotracks < ActiveRecord::Migration[5.2]
  def change
    add_column :audiotracks, :music, :string

  end
end
