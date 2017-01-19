class CommentSerializer < ActiveModel::Serializer
  attributes :message, :created_at
  belongs_to :user
end
