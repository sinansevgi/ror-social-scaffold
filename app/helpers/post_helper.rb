module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def friendship_requests
    current_user.friendships.where(status: 2)
  end
end
