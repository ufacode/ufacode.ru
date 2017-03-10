class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :rate]
  
  def create
    comment        = Comment.new(comment_params)
    comment.author = current_user
    if comment.save
      render comment
    else
      render json: {errors: comment.errors}, status: :unprocessable_entity
    end
  end

  def update
  end

  def rate 
    if params[:act] == 'like'
      @comment.like!(current_user)
    else
      @comment.dislike!(current_user)
    end

    rating_value = @comment.rating
    respond_to do |format|
      format.json {render json: rating_value}
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end
end
