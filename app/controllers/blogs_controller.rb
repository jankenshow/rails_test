class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = current_user.blogs.build
  end
  
  def create
    @blog = current_user.blogs.build(blog_params)
      if @blog.save
        redirect_to root_url, notice: 'Blog was successfully created.'
      else
        render :new_blog
      end
  end

  def show
  end

  def edit
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

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
