class Posts::CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.create!(content: params[:comment][:content], user: current_user)
    redirect_to post_path(@post)+"#comment#{@comment.id}", notice: t('comments.created')
  rescue => e
    redirect_to post_path(@post), alert: e.message
  end
  
  def destroy
    if @post.user == current_user
      @post.comments.destroy(params[:id])
      redirect_to post_path(@post)+"#comments", notice: t('comments.destroyed')
    else
      redirect_to post_path(@post)+"#comments", alert: t('comments.access_denied') }       
    end
  end

  private
  def set_post    
    @post = Post.find(params[:post_id])
  end
end