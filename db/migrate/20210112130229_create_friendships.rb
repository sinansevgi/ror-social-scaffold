

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.integer :status

      t.timestamps
    end
  end
end
