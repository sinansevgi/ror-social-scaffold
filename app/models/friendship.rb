class Friendship < ApplicationRecord
  validates :status, presence: true
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_update do |friendship|
    friendship.destroy if friendship.status == 4
    if friendship.status == 3
      reverse = Friendship.create(user_id: friendship.friend_id, friend_id: friendship.user_id, status: 3)
      unless reverse.status == friendship.status
        reverse.status = friendship.status
        reverse.save
      end
    end
  end

  def reverse
    Friendship.new(user_id: friend_id, friend_id: user_id, status: status)
  end
end
