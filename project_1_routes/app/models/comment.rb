# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :author_id, :artwork_id, :body, presence: true

  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id

  belongs_to :artwork
end
