class OrganiserPanelController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!

  def index; end

  def competitors
    @competitors = @scheduled_event.competitors
  end

  def teams
    @teams = @scheduled_event.teams
  end

  private

  def find_event
    @event = Event.find_by(slug: params[:event_id])
    @scheduled_event = ScheduledEvent.find_by(slug: params[:id])
  end
end
