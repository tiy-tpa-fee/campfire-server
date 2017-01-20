class Story < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  scope :featured, -> { where(is_featured: true) }
  scope :per, -> p { limit(p) }
  scope :page, -> p, pp { limit(pp.to_i).offset(pp.to_i * p.to_i) }
  scope :tag, -> tag { joins(:tags).merge(Tag.where(name: tag)).distinct }

  def tag_list
    tags.map(&:name).join(" ")
  end

  def tag_list=(names)
    self.tags = names.split(" ").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def primary_tag
    tags.primary.first
  end

  def primary_tag=(tag)
    tags.push Tag.primary.where(name: tag)
  end
end
