require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'Request spec for users index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text for user index' do
      get '/users'
      expect(response.body).to include('List of users')
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end
  
  describe 'Request spec for users show' do
    it 'returns a successful response' do
      get '/users/:id'
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text for user show' do
      get '/users/:id'
      expect(response.body).to include('User Profile')
    end

    it 'renders the show template' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end
  end
end
