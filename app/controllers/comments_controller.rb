# frozen_string_literal: true
class CommentsController < ApplicationController
  def create
    post = Post.find(params[:comment][:post_id])
    comment = post.comments.new(comment_params)
    comment.author = current_user

    if comment.save
      redirect_to "#{post_path(post)}#comment#{comment.id}", notice: t('comments.created')
    else
      redirect_to post_path(post), alert: t('comments.failed')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end
end
