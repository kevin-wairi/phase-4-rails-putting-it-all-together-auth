class SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :ok
      else
        render json: {errors: ["Invalid username or password"]},status: :unauthorized 
      end
    end
  
    def destroy
        if session[:user_id].nil?
          render json: {errors: ["a kind of Array"]},status: :unauthorized
        else
          session[:user_id] = nil
          head :no_content
        end
      end
      

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end