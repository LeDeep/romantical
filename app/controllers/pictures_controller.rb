class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end


  def create
    @picture = Picture.create(params[:picture])
    flash[:notice] = "Your picture was created."
    redirect_to pictures_path 
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end
  
  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
      flash[:notice] = "You have successsfully updated your picture."
      redirect_to picture_path(@picture)
    else
      flash[:alert] = "Your picture was not updated - please try again."
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Your picture was successfully deleted."
    redirect_to picture_path(@picture)
  end
  
end
