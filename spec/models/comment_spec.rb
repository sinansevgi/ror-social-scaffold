require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) { User.create!(name: 'test', email: 'test@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  let(:post) { user.posts.create!(content: 'test') }

  describe 'validation tests' do
    it 'ensures content presence' do
      expect{Comment.create!( user_id: user.id, post_id: post.id)}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a two new comments' do
      comment1 = post.comments.create!(user_id: user.id, :content => "first comment")
      comment2 = post.comments.create!(user_id: user.id, :content => "second comment")
      expect(post.comments).to eq([comment1, comment2])
    end
    end
end
