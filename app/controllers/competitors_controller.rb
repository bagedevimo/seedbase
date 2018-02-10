class CompetitorsController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!
  before_action :find_scheduled_event

  def index
    @competitors = @scheduled_event.competitors
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_scheduled_event
    @scheduled_event = @event.scheduled_events.find(params[:schedule_id])
  end
end
