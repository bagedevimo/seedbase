class OrganiserPanelController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!

  def index
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end
end
