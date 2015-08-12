class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.update_attributes(user_profiles)
    if @user.save
      flash[:success] = "Update Complete!"
      redirect_to @user
    else
      flash[:danger] = "Update error!"
      render 'edit'
    end
  end

  def settingsedit
    @user = User.find_by(id: session[:user_id])
  end

  def settingsupdate
    @user = User.find_by(id: session[:user_id])
    @user.update_attributes(user_settings)
    if @user.save
      flash[:success] = "Update Complete!"
      redirect_to @user
    else
      flash[:danger] = "Update error!"
      render 'settingsedit'
    end
  end

  private
  def user_profiles
    params.require(:user).permit(:introduction, :place, :website)
  end

  def user_settings
    params.require(:user).permit(:postsperpage)
  end
end
