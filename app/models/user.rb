class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def user_and_friends
    user_friends = []
    user_friends << id
    friends.each do |friend|
      friendship = Friendship.find_by(user_id: id, friend_id: friend.id)
      user_friends << friend.id if friendship.status == 3
    end
    user_friends
  end
end
