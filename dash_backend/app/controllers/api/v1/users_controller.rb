class Api::V1::UsersController < ApplicationController

 #  include ErrorSerializer
 #  skip_before_action :authenticate, only: [:create]
 #
 #  def index
 #    render json: User.all
 #  end
 #
 #  def show
 #    render json: User.find(params[:id])
 #  end
 #
 #  def create
 #    user = User.new(user_params)
 #    if user.save
 #      render json: {}, status:200
 #    else
 #      render json: ErrorSerializer.serialize(user.errors), status:422
 #    end
 #  end
 #
 #   private
 #
 #   def user_params
 #     params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
 #   end
 # end



 def create
  @user = User.new

  @user.username = params[:username]
  @user.password = params[:password]

  if (@user.save)
    render json: token_json(@user)
  else
    render json: {
      errors: @user.errors.full_messages
    }, status: :unprocessable_entity
  end
end

def users_trips
  @user = User.find_by(id: params[:user_id])

  if (authorized?(@user))
    render json: @user.trips
  else
    render json: { go_away: true }, status: :unauthorized
  end

end

end
