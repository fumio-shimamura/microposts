class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      #set microposts per page(ppp)
      if current_user.postsperpage?
        ppp = current_user.postsperpage
      else
        ppp = 0
      end
      @feed_items = current_user.feed_items.includes(:user).page(params[:page]).per(ppp).order(created_at: :desc)
    end
  end
end
