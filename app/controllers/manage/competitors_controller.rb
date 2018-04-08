class Manage::CompetitorsController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!

  def index
    @competitors = @scheduled_event.competitors
  end

  def show
    @competitor = @scheduled_event.competitors.find(params[:id])
  end

  private

  def find_event
    @event = Event.find_by(slug: params[:event_id])
    @scheduled_event = @event.scheduled_events.find_by(slug: params[:scheduled_id])
  end
end
