# class UsersController < ApplicationController

  
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.create(params[:user])
#     flash[:notice] = "Your account was created."
#     redirect_to root_path
#   end

#   def index
#     @users = User.all
#   end

#   def show
#     @user = User.find(params[:id])
#   end

#   def create
#     @user = User.new(params[:user])

#   end

#   def update
#     @user = User.find(params[:id])

#   end

#   def destroy
#     @user = User.find(params[:id])
#     @user.destroy

#   end

#   def edit
#     @user = User.find(params[:id])
#   end


#   # def update
#   #   @user = User.find(params[:id])
#   #   if @user.update_attributes(params[:user])
#   #     flash[:notice] = "You have successsfully updated."
#   #     redirect_to user_path(@user)
#   #   else
#   #     render :edit
#   #   end
#   # end

#   # def destroy
#   #   @user = User.find(params[:id])
#   #   @user.destroy
#   #   flash[:notice] = "Your user was successfully deleted."
#   #   redirect_to root_path
#   # end

    

# end
