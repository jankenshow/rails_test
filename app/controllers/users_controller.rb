class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save?
      redirect_to root_url
    else
      render 'new_user_registration_path'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def blog_params
      params.require(:blog).permit(:user_id, :title, :body)
    end
end
