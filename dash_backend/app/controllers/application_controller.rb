# class ApplicationController < ActionController::API
#   before_action :authenticate
#
#   def logged_in?
#     !!current_user
#   end
#
#   def current_user
#     if auth_present?
#       user = User.find(auth["user"])
#       if user
#         @current_user ||= user
#       end
#     end
#   end
#
#   def authenticate
#     render json: {error: "unauthorized"}, status: 404 unless logged_in?
#   end
#
#   private
#
#     def token
#       request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
#     end
#
#     def auth
#       Auth.decode(token)
#     end
#
#     def auth_present?
#       !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
#     end
# end
#
#


class ApplicationController < ActionController::API


  def token_json(user)
    {
      username: user.username,
      user_id: user.id,
      token: generate_token(user)
    }
  end

  def generate_token(user)
    user_id = user.id
    JWT.encode({ "user_id": user.id }, jwt_password, 'HS256')
  end

  def jwt_password
    ENV["JWT_PASSWORD"]
  end


  def try_decode_token
    token = request.headers["Authorization"]

    begin
      decoded = JWT.decode(token, jwt_password, true, { algorithm: 'HS256' })
    rescue JWT::VerificationError
      return nil
    end

    decoded
  end

  def current_user_id
    decoded = try_decode_token

    unless decoded && decoded[0] && decoded[0]["user_id"]
      return nil
    end

    decoded[0]["user_id"]
  end

  def valid_token?
    !!try_decode_token
  end

  def authorized?(user)
    current_user_id == user.id
  end

end
