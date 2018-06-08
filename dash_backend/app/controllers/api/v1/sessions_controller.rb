# class Api::V1::SessionsController < ApplicationController
#
#   skip_before_action :authenticate, only: [:create]
#
#   def create
#     user = User.find_by(username: auth_params[:username])
#     if user && user.authenticate(auth_params[:password])
#       jwt = Auth.issue({user: user.id})
#       render json: {jwt: jwt}
#     else
#       render json: {:errors=>
#         [{:detail=>"incorrect email or password",
#           :source=>{:pointer=>"user/err_type"}}
#         ]}, status: 404
#     end
#   end
#
#   private
#     def auth_params
#       params.require(:auth).permit(:username, :password)
#     end
# end


class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])
    if (@user && @user.authenticate(params["password"]))
      render json: token_json(@user)
    else
      render json: {
        errors: "Those credentials don't match anything we have in our database"
      }, status: :unauthorized
    end
  end

end
