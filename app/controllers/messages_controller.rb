class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    
    @message = Message.new(params[:message])
    if @message.save!
      redirect_to messages_path
      flash[:notice] = "Your message has been sent!"
    else
      flash[:alert] = "There were errors."
      render :new
     end
  end
 
  def index
    @messages = Message.all
  end
end