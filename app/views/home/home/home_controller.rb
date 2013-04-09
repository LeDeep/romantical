class HomeController < ApplicationController
  def index
  end

  def update
    res = current_user.soundcloud_client.put("/me", :user => {:description => params[:description]})
  end
end