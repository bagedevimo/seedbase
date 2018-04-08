class Manage::TeamsController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!

  def index
    @teams = @scheduled_event.teams
  end

  def show
    @team = @scheduled_event.teams.find(params[:id])
  end

  def destroy
    team = @scheduled_event.teams.find(params[:id])
    team.destroy!
    redirect_to manage_scheduled_event_path(@event, @scheduled_event)
  end

  private

  def find_event
    @event = Event.find_by(slug: params[:event_id])
    @scheduled_event = ScheduledEvent.find_by(slug: params[:scheduled_id])
  end
end
