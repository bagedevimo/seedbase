# Preview all emails at http://localhost:3000/rails/mailers/team_invite_mailer
class TeamInviteMailerPreview < ActionMailer::Preview
  def invite
    user = User.find_or_create_by!(name: "Freddy Test", email: "freddy@example.com")
    event = Event.find_or_create_by!(name: "TestJam", slug: "testjam")
    sch = event.scheduled_events.find_or_create_by!(name: "2018", starts_at: Time.now + 3.days, ends_at: Time.now + 5.days, location_text: "here", lat: 0, long: 0, maximum_team_size: 5, slug: "2018")
    team = sch.teams.find_or_create_by!(name: "Test Team")
    invite = TeamInvite.find_or_create_by!(user: user, invited_email: "bobby@example.com", team: team)

    TeamInviteMailer.invite(invite)
  end
end
