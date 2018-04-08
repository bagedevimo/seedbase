class TeamsController < ApplicationController
  before_action :find_team, except: [:create]
  before_action :require_member_of_team_or_organiser, except: [:create]

  def create
    @scheduled_event = ScheduledEvent.find(params[:team][:scheduled_event_id])

    puts "sch_id: #{@scheduled_event.id}"

    ActiveRecord::Base.transaction do
      @team = @scheduled_event.teams.create!(team_params)
      @team.members << current_competitor
    end

    redirect_to scheduled_event_path(@scheduled_event.event, @scheduled_event)
  end

  def destroy
    # This action is a bit mis-named
    # The actual function is to remove a competitor from a team
    # and only remove the team if that is the last competitor
    @team.members.where(id: current_competitor.id).update_all(team_id: nil)
    @team.save!

    if @team.members.empty?
      @team.destroy!
    end

    redirect_to scheduled_event_path(@scheduled_event.event, @scheduled_event)
  end

  private

  def find_team
    @team = Team.find(params[:id])
    @scheduled_event = @team.scheduled_event
  end

  def team_params
    params.require(:team).permit(:name)
  end

  def require_member_of_team_or_organiser
    unless current_competitor.team == @team
      redirect_to @scheduled_event, error: "You must be a member of the team to edit the team"
    end
  end
end
