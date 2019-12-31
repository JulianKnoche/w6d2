class ArtworkShare < ApplicationRecord
   validates :artist_id, :artwork_id, presence: true
  # validates :title, uniqueness: { scope: :artist_id, message: "should be unqie for all artist's work"}


  has_many :artworks, foreign_key: :artist_id

end 