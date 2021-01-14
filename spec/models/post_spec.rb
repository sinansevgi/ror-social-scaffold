

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'test', email: 'test@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  let(:post) { user.posts.build(content: 'test') }

  describe 'validation tests' do
    it 'ensures content presence' do
      expect { Post.create!(user_id: user.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new record' do
      expect(post.content).to eq('test')
    end
  end
end
