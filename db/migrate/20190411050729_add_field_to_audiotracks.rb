class AddFieldToAudiotracks < ActiveRecord::Migration[5.2]
  def change
    add_column :audiotracks, :name, :string
    add_column :audiotracks, :image, :string

    add_index :audiotracks, :name
  end
end
