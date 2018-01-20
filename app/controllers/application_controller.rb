class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    @logged_in_user = User.find_by(id: session[:user_id])

    redirect_to new_session_url, alert: "You must be logged in to do that" unless @logged_in_user
  end
end
