class TeamInviteMailer < ApplicationMailer
  def invite(team_invite)
    @invite = team_invite

    mail(
      from: "invites@seedbase.xyz",
      to: team_invite.invited_email,
      subject: "#{team_invite.user.name} has invited you to join #{team_invite.team.name} for #{team_invite.team.scheduled_event.event.name}"
    )
  end
end
