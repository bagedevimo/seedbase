class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    redirect_to new_session_path, alert: "Email address not found" and return unless user

    authenticated_user = user.authenticate(params[:password])
    redirect_to new_session_path, alert: "Password incorrect" and return unless authenticated_user

    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    session[:user_id] = "0"
    redirect_to root_path
  end
end
