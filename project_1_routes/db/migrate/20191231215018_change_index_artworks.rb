class ChangeIndexArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, :title
  end
end
