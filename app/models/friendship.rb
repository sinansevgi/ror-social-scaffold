class Friendship < ApplicationRecord
  validates :status, presence: true
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create do |friendship|
    unless Friendship.find_by(user_id: friendship.friend_id, friend_id: friendship.user_id)
      reverse = Friendship.create(user_id: friendship.friend_id, friend_id: friendship.user_id, status: 2)
      reverse.save
    end
  end

  after_update do |friendship|
    reverse = Friendship.find_by(user_id: friendship.friend_id, friend_id: friendship.user_id)
    unless (reverse.status == friendship.status) || (friendship.status != 3 && friendship.status != 4)
      reverse.status = friendship.status
      reverse.save
      if friendship.status == 4
        reverse.destroy
        friendship.destroy
      end
    end
  end
end
