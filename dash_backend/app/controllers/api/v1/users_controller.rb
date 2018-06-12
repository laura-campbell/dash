class Api::V1::UsersController < ApplicationController

   def index
     @users = User.all
     render json: @users
   end

   def show
     @user = User.find_by(params[:id])
     render json: @user
   end

   def users_trips
     @user = User.find_by(id: params[:user_id])
     @user_trips = Trip.all.select{ |trip| trip[:user_id] == @user.id }
     byebug
     render json: @user_trips
   end

   def create

   end

   def update

   end


 end
