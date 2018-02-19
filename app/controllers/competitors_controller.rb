class CompetitorsController < ApplicationController
  before_action :find_scheduled_event, except: [:destroy]
  before_action :authenticate_organiser!, except: [:new, :create, :destroy]

  def new
    @competitor = @scheduled_event.competitors.new(user: current_user)
  end

  def create
    @scheduled_event.competitors.create!(user: current_user)
    redirect_to scheduled_event_path(@event, @scheduled_event)
  end

  def destroy
    @competitor = Competitor.find(params[:id])
    @scheduled_event = @competitor.scheduled_event
    @event = @scheduled_event.event

    render plain: "no" unless @competitor.user == current_user

    @competitor.destroy!

    redirect_to scheduled_event_path(@event, @scheduled_event)
  end

  private

  def find_scheduled_event
    @scheduled_event = ScheduledEvent.find(params[:scheduled_event])
    @event = @scheduled_event.event
  end
end
