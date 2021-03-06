class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(@user.postsperpage)
    @following_users = @user.following_users
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  

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
