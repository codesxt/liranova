class DesktopController < ApplicationController
  def index
	@micropost = current_user.microposts.build if signed_in?
  end
end
