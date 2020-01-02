# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id, message: "has already been shared with user" }


  belongs_to :artwork
 
  belongs_to :viewer, 
    foreign_key: :viewer_id,
    class_name: :User

end 
