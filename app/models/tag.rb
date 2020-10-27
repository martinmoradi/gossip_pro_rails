class Tag < ApplicationRecord
  has_many :tag_assignments
  has_many :gossips, through: :tag_assignments
end
