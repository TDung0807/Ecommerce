class ApplicationController < ActionController::API
    before_action :authenticate_user!
  
    def authenticate_user!
      header = request.headers["Authorization"]
      token = header.split(" ").last if header
  
      begin
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        @current_user = User.find(decoded["user_id"])
      rescue
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
  