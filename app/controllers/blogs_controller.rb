class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all
    render json: @blogs, status: :ok
  end
  
  def show
    @blog = Blog.find params[:id]
    render json: @blog, status: :ok
  end
end
