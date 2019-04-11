class CreateAudiotracks < ActiveRecord::Migration[5.2]
  def change
    create_table :audiotracks do |t|

      t.timestamps
    end
  end
end
