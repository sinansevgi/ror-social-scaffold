module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def friendship_request_buttons(user)
    return ' ' unless user.friendships.find_by(friend_id: current_user.id)

    friendship = user.friendships.find_by(friend_id: current_user.id)
    accept_button = link_to('Accept', friendship_update_path(friendship.id, status: 3), method: :post, class: 'btn')
    reject_button = link_to('Reject', friendship_update_path(friendship.id, status: 4), method: :post, class: 'btn')
    return accept_button + reject_button if friendship.status == 1
    return 'Friend request sent.' if friendship.status == 2
    return 'Friend' if friendship.status == 3
    return 'Friendship request rejected.' if friendship.status == 4
  end

  def friendship_buttons(user)
    return ' ' if current_user.id == user.id

    invite_button = link_to('Invite to friendship', friendships_path(friend_id: user), method: :post, class: 'btn')
    return invite_button unless current_user.friendships.find_by(friend_id: user.id)

    friendship_request_buttons(user)
  end
end
