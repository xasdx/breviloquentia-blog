class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    json_response @blogs
  end

  def show
    @blog = Blog.find params[:id]
    json_response @blog
  end

  def create
    @blog = Blog.create blog_params
    json_response @blog, :created
  end

  private

  def blog_params
    params.permit(:name, :title, :subtitle, :description, :user_id)
  end
end
