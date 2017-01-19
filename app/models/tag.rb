class Tag < ApplicationRecord
  has_many :taggings
  has_many :stories, through: :taggings

  scope :primary, -> { where is_primary: true }
end
