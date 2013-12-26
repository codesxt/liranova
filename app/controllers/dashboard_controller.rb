class DashboardController < ApplicationController
  def index
	if signed_in?
		@feed_items = current_user.feed.paginate(page: params[:page]).where("status" => true)
    end
  end
end
