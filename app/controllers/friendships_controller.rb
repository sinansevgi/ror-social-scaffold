class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.friendships.all
  end
  
  def create
    #status codes:
    # pending = 1
    # requested = 2
    # accepted = 3
    # rejected = 4
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :status => 1)
    @other = User.find_by(:id => params[:friend_id])
    @reverse = @other.friendships.build(:friend_id => current_user.id, :status => 2)
    redirect_to users_path, notice: 'Friend request submitted.' if @friendship.save && @reverse.save
  end

  def update
    # @friendship = Friendship.find_by(:user_id => params[:friend_id], :friend_id => params[:user_id])
    @friendship.status = params[:status]
  end

  def update_status
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.update(:status => params[:status])
    redirect_to users_path
  end
end
