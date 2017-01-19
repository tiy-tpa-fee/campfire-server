class StorySerializer < ActiveModel::Serializer
  attributes :id, :url , :created_at, :is_featured
  belongs_to :user
  has_many :tags
end
