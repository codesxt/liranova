class LibraryController < ApplicationController
  def index
	if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def show_feed
  	if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
