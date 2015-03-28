class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :only => [:new,:destroy,:edit,:update]
  
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end
 
  def edit
  end
 
  def create
    @post = Post.new(post_params)
    @post.blog = Blog.find(params[:post][:blog_id]) if params[:post][:blog_id]
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

  private    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:name, :content, :image)
    end
end
