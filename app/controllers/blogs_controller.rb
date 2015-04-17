class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:new, :destroy, :edit, :update]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author = current_user
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  # setup blog
  def set_blog
    @blog = Blog.find_by_uri(params[:id])
  end

  # whitelist for params
  def blog_params
    params.require(:blog).permit(:name, :description, :uri)
  end
end
