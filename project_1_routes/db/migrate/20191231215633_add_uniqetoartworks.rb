class AddUniqetoartworks < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, [:title, :artist_id ]
    add_index :artworks, [:title, :artist_id ], unique: true
  end
end
 