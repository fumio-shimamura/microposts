class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    #set microposts per page(ppp)
    if current_user.postsperpage?
      ppp = current_user.postsperpage
    else
      ppp = 0
    end
    @microposts = @user.microposts.page(params[:page]).per(ppp)
    
    @following_users = @user.following_users
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  #追加
  def followings
    @user = User.find(params[:id])
    @following_users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @follower_users = @user.follower_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,  :password, :password_confirmation)
  end
end
