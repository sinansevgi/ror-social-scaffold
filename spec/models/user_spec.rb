require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'test', email: 'test@test.com', password: '123456', encrypted_password: '123456', gravatar_url: 'www.test.com') }
  describe 'validation tests' do
    it 'ensures name presence' do
      expect{User.create!( email: 'test@test.com', encrypted_password: '123456', gravatar_url: 'www.test.com')}.to raise_error(ActiveRecord::RecordInvalid)
    end
    
     it 'ensures email presence' do
       expect{User.create!(name: 'test', encrypted_password: '123456', gravatar_url: 'www.test.com')}.to raise_error(ActiveRecord::RecordInvalid)
     end

     it 'ensures password presence' do
       expect{User.create!(name: 'test', email: 'test@test.com', gravatar_url: 'www.test.com')}.to raise_error(ActiveRecord::RecordInvalid)
     end

    it 'creates a new record' do
      expect(user.name).to eq('test')
    end
  end
end
