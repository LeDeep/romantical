class CouplesController < ApplicationController

  def new
    if user_signed_in?
      render :new
    else
      redirect_to root_path
    end
  end
end