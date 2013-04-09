class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(params[:profile])
    flash[:notice] = "Your profile was created."
    redirect_to profiles_path 
    # redirect_to profile_path(@profile)
  end
 
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "You have successsfully updated your profile."
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Your profile was not updated - invalid input."
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "Your profile was successfully deleted."
    redirect_to root_path
  end
end
