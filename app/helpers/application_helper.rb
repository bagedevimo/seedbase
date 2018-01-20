module ApplicationHelper
  def current_user
    @logged_in_user ||= User.find_by(id: session[:user_id])
  end

  def profile_picture_url
    gravtar_url
  end

  def gravtar_url
    hash = Digest::MD5.hexdigest(current_user.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
