module ApplicationHelper
  def current_user
    @logged_in_user ||= User.find_by(id: session[:user_id])
  end

  def current_competitor
    @scheduled_event&.competitors&.where(user: current_user)&.first  
  end

  def profile_picture_url
    gravtar_url
  end

  def gravtar_url
    hash = Digest::MD5.hexdigest(current_user.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def current_user_organiser_for?(event)
    event.organisers
      .joins(:user)
      .joins(:event)
      .where("organisers.deleted_at IS NULL")
      .where("users.deleted_at IS NULL")
      .where("events.deleted_at IS NULL")
      .where(user: current_user)
      .count > 0
  end
end
