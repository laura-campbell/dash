class Api::V1::AuthenticationController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({user_id: user.id}, ENV['JWT_PASSWORD'], 'HS256')
      }
    else
      render json: {error: 'User not found'}, status: 404
    end
  end

def signup
  user = User.create(user_params)
  if user && user.authenticate(params[:password_digest])
    render json: {
      id: user.id,
      username: user.username,
      jwt: JWT.encode({user_id: user.id}, ENV['JWT_PASSWORD'], 'HS256')
      }
  else
    render json: {errors: 'User not valid'}, status: 422
  end
end


  def show
    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end



 private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
   end
  end
