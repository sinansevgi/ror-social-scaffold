require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation tests' do
    it 'ensures name presence' do
      user = User.new( email: 'test@test.com', encrypted_password: '123456', gravatar_url: 'www.test.com').save
      expect(user).to eq(false)
    end
    
    # it 'ensures email presence' do
    #   user = User.new(name: 'test', encrypted_password: '123456', gravatar_url: 'www.test.com')
    # end
    
    # it 'ensures name presence' do
    #   user = User.new(name: 'test', email: 'test@test.com', encrypted_password: '123456', gravatar_url: 'www.test.com')
    # end
    
    # it 'ensures name presence' do
    #   user = User.new(name: 'test', email: 'test@test.com', encrypted_password: '123456', gravatar_url: 'www.test.com')
    # end
    

  end
end
