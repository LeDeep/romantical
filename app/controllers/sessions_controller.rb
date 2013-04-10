class SessionsController < ApplicationController

  def new  
  end

  def create
    if user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in."
    else 
      redirect_to new_session_path, alert: "Email or Password was invalid!"
    end
  end



end