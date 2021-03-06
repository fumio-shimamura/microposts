class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed_items.includes(:user).page(params[:page]).per(current_user.postsperpage).order(created_at: :desc)
    end
  end
end
