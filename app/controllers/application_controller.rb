class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to new_session_url, alert: "You must be logged in to do that" unless current_user
  end

  def current_user
    @logged_in_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_organiser!
    unless current_user.events.include?(@event)
      redirect_to new_session_url, alert: "You must be an organiser to do that"
    end
  end
end
