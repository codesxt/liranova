class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @feed_items = current_user.feed.where(status: true).paginate(page: params[:page])
    end
  end

  def help
  end
  
  def contact
  end
end
