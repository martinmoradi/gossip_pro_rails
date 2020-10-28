class Tag < ApplicationRecord
  has_many :tag_assignments, dependent: :destroy
  has_many :gossips, through: :tag_assignments
end
