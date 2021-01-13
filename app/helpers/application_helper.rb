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

  def friendship_buttons(user)
    unless current_user.id == user.id
    unless current_user.friendships.find_by(friend_id: user.id)
      return link_to('Invite to friendship', friendships_path(:friend_id => user), :method => :post, class: "btn")
    end
    if user.friendships.find_by(friend_id: current_user.id)
      friendship = user.friendships.find_by(friend_id: current_user.id)
      if friendship.status == 1
        return link_to('Accept', friendship_update_status_path(friendship.id, :status => 3), :method => :post , class: "btn") + link_to('Reject', friendship_update_status_path(friendship.id, :status => 4), :method => :post, class: "btn")
      end
      if friendship.status == 2
        return "Friend request sent."
      end
      if friendship.status == 3
        return "Friend"
      end
    end
    end
  end
end
