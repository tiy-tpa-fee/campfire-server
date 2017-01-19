class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  before_action :set_story
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /stories/1/comments
  def index
    @comments = @story.comments.all

    render json: @comments
  end

  # GET /stories/1/comments/1
  def show
    render json: @comment
  end

  # POST /stories/1/comments
  def create
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1/comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @story.comments.find(params[:id])
    end

    def set_story
      @story = Story.find(params[:story_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:message)
    end
end
