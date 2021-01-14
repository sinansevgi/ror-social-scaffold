class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :status => 1)
    redirect_to users_path, notice: 'Friend request submitted.' if @friendship.save

  end

  def update
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.update(:status => params[:status])
    redirect_to users_path
  end
end
