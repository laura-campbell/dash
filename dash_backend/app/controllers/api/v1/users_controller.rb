class Api::V1::UsersController < ApplicationController

   def index
     @users = User.all
     render json: @users
   end

   def show
     @user = User.find(params[:id])
     render json: @user
   end

   def users_trips
     @user = User.find_by(id: params[:user_id])
     @user_trips = Trip.all.select{ |trip| trip[:user_id] == @user.id }
     render json: @user_trips
   end

   def create
     @user = User.create(user_params)
     render json: @user
   end

   def update

   end


   private

     def user_params
       params.require(:user).permit(:first_name, :last_name, :username, :email, :password_digest)
     end
    end
