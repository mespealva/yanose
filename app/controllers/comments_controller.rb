# frozen_string_literal: true

# Controller for managing Comments in the application
class CommentsController < ApplicationController
  # GET /comments/new
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  # POST /comments
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
