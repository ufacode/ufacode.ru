class SearchController < ApplicationController
  def index; end

  def create
    @posts = Post.search do
      with(:blog_id, params[:blog_id]) if params[:blog_id].present?
      fulltext params[:query] do
        boost_fields :name => 5.0
      end
      paginate :page => params[:page], :per_page => 10
    end.results

    render action: :index
  end

end
