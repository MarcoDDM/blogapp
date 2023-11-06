require 'rails_helper'

RSpec.describe UserPostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get user_user_posts_path(user_id: 1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get user_user_post_path(user_id: 1, id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get user_path(id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end
