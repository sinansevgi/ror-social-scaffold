require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user2) { User.create!(name: 'test2', email: 'test2@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  let(:user) { User.create!(name: 'test', email: 'test@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  let(:post) { user.posts.create!(content: 'test') }

  describe 'validation tests' do
    it 'ensures user presence' do
      expect{post.likes.create!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new record' do
      like = post.likes.create!(user_id: user2.id)
      expect(post.likes).to eq([like])
    end
  end
end
