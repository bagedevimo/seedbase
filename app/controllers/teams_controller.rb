class TeamsController < ApplicationController
  before_action :find_event
  before_action :find_scheduled
  before_action :require_member_of_team_or_organiser, except: [:create]

  def create
    ActiveRecord::Base.transaction do
      @team = @scheduled.teams.create!(team_params)
      @team.members << current_competitor
    end

    redirect_to @event
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_scheduled
    @scheduled = @event.scheduled_events.find(params[:schedule_id])
  end

  def require_member_of_team_or_organiser
    raise "IMPLEMENT ME"
  end
end
