

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create!(name: 'test', email: 'test@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  let(:user2) { User.create!(name: 'test2', email: 'test2@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }

  describe 'validation tests' do
    it 'ensures status presence' do
      expect { user1.friendships.create!(friend_id: user2.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new friendship' do
      friendship = user1.friendships.create!(friend_id: user2.id, status: 2)
      expect(user1.friendships).to eq([friendship])
    end
  end
  describe 'association tests' do
    it 'check if user1 is friend of 2' do
      user1.friendships.create!(friend_id: user2.id, status: 2)
      expect(user2.friends.first).to eq(user1)
    end
    it 'check if user2 is friend of 1' do
      user1.friendships.create!(friend_id: user2.id, status: 2)
      expect(user1.friends.first).to eq(user2)
    end
  end
end
