require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'Request spec for users index' do
    it 'returns a successful response' do
      puts 'Checking HTTP status for users index...'
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'Request spec for users show' do
    it 'returns a successful response' do
      puts 'Expecting to receive a successful response for users show...'
      get '/users/:id'
      expect(response).to have_http_status(200)
    end

    it 'includes the correct placeholder text in the response body' do
      puts 'Expecting to receive the correct placeholder text for users show...'
      get '/users/:id'
      expect(response.body).to include('User Profile')
    end
  end
end
