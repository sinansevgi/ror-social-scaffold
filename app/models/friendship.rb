class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_update do |friendship|
    reverse = Friendship.find_by(user_id: friendship.friend_id, friend_id: friendship.user_id)
    unless reverse.status == friendship.status
      reverse.status = friendship.status
      reverse.save
    end
  end
end
