# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :rate]
  load_and_authorize_resource only: [:new, :destroy, :edit, :update]

  layout 'simple', only: [:show]

  def index
    @posts = Post.filter_by_tag(params[:tag]).newest.page(params[:page]).per(15)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to @post, notice: t('posts.created')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.updated')
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('posts.deleted')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :image, :blog_id, :tag_list)
  end
end
