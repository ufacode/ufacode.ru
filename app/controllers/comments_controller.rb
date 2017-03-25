# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :rate]

  def create
    comment = Comment.new(comment_params)
    comment.author = current_user
    if comment.save
      render comment
    else
      render json: { errors: comment.errors }, status: :unprocessable_entity
    end
  end

  def update; end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end
end
