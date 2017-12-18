class BlogsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all  #paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @blog = current_user.blogs.build
  end
  
  def create
    @blog = current_user.blogs.build(blog_params)
      if @blog.save
        flash[:success] = "Micropost created!"
        redirect_to root_url #, notice: 'Blog was successfully created.'
      else
        render :new
      end
  end

  def show
    REDIS.zincrby "blogs/pv", 1, @blog.id
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog #, notice: 'Blog was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    REDIS.zrem("blogs/pv", @blog.id)
    @blog.destroy
    redirect_to blogs_url #, notice: 'Blog was successfully destroyed.'
  end

  private

    def set_blog
      @blog = Blog.find(params[:id])
    end
    
    def blog_params
      params.require(:blog).permit(:title, :body, :user_id)
    end
    
end
