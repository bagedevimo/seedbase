class TeamInvitesController < ApplicationController
  def create
    team            = Team.find(params[:team_id])
    scheduled_event = team.scheduled_event
    event           = scheduled_event.event

    unless team.users.include?(current_user)
      redirect_to scheduled_event_path(event, scheduled_event), alert: "You must be a member of the team to invite to it"
      return
    end

    team.team_invites.create!(user: current_user, invited_email: params[:email])

    redirect_to scheduled_event_path(event, scheduled_event)
  end

  def accept
    invite = TeamInvite.find(params[:team_invite_id])
    session[:session_next] = team_invite_accept_path(invite)
    redirect_to new_session_path
  end
end
