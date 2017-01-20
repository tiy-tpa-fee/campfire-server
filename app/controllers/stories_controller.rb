class StoriesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_story, only: [:show, :update, :destroy]

  has_scope :featured, type: :boolean
  has_scope :per
  has_scope :tag
  has_scope :page do |controller, scope, value|
    scope.page(value || 1, controller.params[:per])
  end

  # GET /stories
  def index
    @stories = apply_scopes(Story).all

    render json: @stories
  end

  # GET /stories/1
  def show
    render json: @story
  end

  # POST /stories
  def create
    @story = current_user.stories.new(story_params)

    if @story.save
      render json: @story, status: :created, location: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @story.update(story_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def story_params
      params.require(:story).permit(:url, :tag_list, :primary_tag)
    end
end
