class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tags_assignments
  has_many :tags, through: :tag_assignments
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
end
