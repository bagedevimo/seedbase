class CompetitorsController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!, except: [:new]
  before_action :find_scheduled_event

  def index
    @competitors = @scheduled_event.competitors
  end

  def new
    @competitor = @scheduled_event.competitors.new(user: current_user)
  end

  def create
    @competitor = @scheduled_event.competitors.create!(user: current_user)
    redirect_to named_event_path(@event.name.downcase)
  end

  def destroy
    @competitor = @scheduled_event.competitors.find(params[:id])
    @competitor.destroy!

    redirect_to named_event_path(@event.name.downcase)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_scheduled_event
    @scheduled_event = @event.scheduled_events.find(params[:schedule_id])
  end
end
