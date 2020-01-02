# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :artist_id, :title, :image_url, presence: true
  validates :title, uniqueness: { scope: :artist_id, message: "should be unqie for all artist's work"}

  belongs_to :user, 
  class_name: 'User',
  foreign_key: :artist_id

  has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    dependent: :destroy
    

  has_many :shared_viewers, 
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    dependent: :destroy

  
end
