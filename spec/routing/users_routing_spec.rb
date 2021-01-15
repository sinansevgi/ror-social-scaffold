

require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #new' do
      expect(get: '/users/sign_up').to route_to('devise/registrations#new')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('devise/sessions#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
    end
  end
end
