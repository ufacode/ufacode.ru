class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :rate]
  load_and_authorize_resource only: [:new, :destroy, :edit, :update]

  def index
    @posts = Post.page(params[:page]).per(15)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def rate
    if params[:act] == 'like'
      @post.like!(current_user)
    else
      @post.dislike!(current_user)
    end

    rating_value = @post.rating
    respond_to do |format|
      format.json { render json: rating_value }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :image, :blog_id)
  end
end
