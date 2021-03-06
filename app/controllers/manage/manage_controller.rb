class Manage::ManageController < ApplicationController
  before_action :find_event
  before_action :authenticate_organiser!

  def index; end

  def competitors
    @competitors = @scheduled_event.competitors
  end

  def teams
    @teams = @scheduled_event.teams
  end

  def destroy_team
    team = @scheduled_event.teams.find(params[:team_id])
    team.destroy!
    redirect_to manage_scheduled_event_path(@event, @scheduled_event)
  end

  private

  def find_event
    puts "params: #{params}"
    @event = Event.find_by(slug: params[:event_id])
    @scheduled_event = @event.scheduled_events.find_by(slug: params[:scheduled_id])
  end
end
