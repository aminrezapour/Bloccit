module PostsHelper
  # used in posts/show.html.erb
  def user_is_authorized_for_post?(post)
        current_user && (current_user == post.user || current_user.admin?)
  end
  # used in posts/show.html.erb
  def user_is_admin_or_moderator_or_owner_for_post?(post)
        current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
  end
end
