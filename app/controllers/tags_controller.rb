class TagsController < ApplicationController

  has_scope :primary, type: :boolean

  # GET /tags
  def index
    @tags = apply_scopes(Tag).all
    render json: @tags
  end
end
