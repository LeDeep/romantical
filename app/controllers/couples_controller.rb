class CouplesController < ApplicationController

  def new
    @couple = Couple.new
  end

  def create
    profile = Profile.find(params[:profile_id])
    partner = Profile.find(params[:partner_id])
    if @couple = Couple.create!(params[:couple])
      profile.update_attribute(:couple_id, @couple.id)
      partner.update_attribute(:couple_id, @couple.id)
      flash[:notice] = "You were successfully coupled!"
      redirect_to couple_path(@couple)
    else
      flash.now[:alert] = "There were errors."
      render :new
    end
  end

  def edit
    @couple = Couple.find(params[:id])
  end

  def update
    @couple = Couple.find(params[:id])
    if @couple.update_attributes(params[:couple])
      flash[:notice] = "You have successsfully updated your couple information."
      redirect_to couple_path(@couple)
    else
      flash[:alert] = "Your couple was not updated - invalid input."
      render :edit
    end
  end

  def destroy
    @couple = Couple.find(params[:id])
    @couple.destroy
    flash[:notice] = "Your couple was successfully deleted."
    redirect_to root_path
  end

end