class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
  	@micropost = current_user.microposts.build(micropost_params)
  	if @micropost.save
  		flash[:success] = "Micropost creates!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  def destory
    @micropost = current_user.microposts.find(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destory
    flas[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
  	params.require(:micropost).permit(:content)
  end
end