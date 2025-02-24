module Api
  module V1
    class SessionsController < ApplicationController
        skip_before_action :authenticate_user!, only: [:create] 
        def create
          user = User.find_by(email: params[:email])
      
          if user&.authenticate(params[:password])
            token = user.generate_jwt
            render json: { token: token }, status: :ok
          else
            render json: { error: "Invalid email or password" }, status: :unauthorized
          end
        end
      end
  end
end

  