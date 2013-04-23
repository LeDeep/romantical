class ProfilesController < ApplicationController

  # def new
  #   @profile = Profile.new
  # end

  # def create
  #   @profile = current_user.profile.new(params[:profile])
  #   if @profile.save
  #     redirect_to profile_path(current_user), notice: "You have created your profile!"
  #   else
  #     flash.now[:alert] = "There were errors."
  #     render :new
  #   end
  # end
 

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to profile_path(@profile), :notice => "You have successsfully updated your profile."
    else
      flash[:alert] = "Your profile was not updated - invalid input."
      render :edit
    end
  end
end
