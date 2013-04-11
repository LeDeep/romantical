class CouplesController < ApplicationController

  def new
    if current_user
      render :new
    else
      redirect_to root_path
    end
  end
end