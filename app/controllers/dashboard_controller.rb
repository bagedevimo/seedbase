class DashboardController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.all.active
  end
end
