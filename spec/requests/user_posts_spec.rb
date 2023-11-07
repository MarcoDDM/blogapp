RSpec.describe UserPostsController, type: :request do
  describe 'Request spec for user posts index' do
    it 'returns a successful response' do
      get user_user_posts_path(user_id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'includes the correct placeholder text for user posts index' do
      get user_user_posts_path(user_id: 1)
      expect(response.body).to include('Welcome to user posts index page')
    end

    it 'renders the index template' do
      get user_user_posts_path(user_id: 1)
      expect(response).to render_template(:index)
    end
  end

  describe 'Request spec for user posts show' do
    it 'returns a successful response' do
      get user_user_post_path(user_id: 1, id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'includes the correct placeholder text for user posts show' do
      get user_user_post_path(user_id: 1, id: 1)
      expect(response.body).to include('Post Details')
    end

    it 'renders the show template' do
      get user_user_post_path(user_id: 1, id: 1)
      expect(response).to render_template(:show)
    end
  end
end

RSpec.describe UsersController, type: :request do
  describe 'Request spec for users index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'includes the correct placeholder text for user index' do
      get users_path
      expect(response.body).to include('List of users')
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
  end

  describe 'Request spec for users show' do
    it 'returns a successful response' do
      get user_path(id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'includes the correct placeholder text for user show' do
      get user_path(id: 1)
      expect(response.body).to include('User Profile')
    end

    it 'renders the show template' do
      get user_path(id: 1)
      expect(response).to render_template(:show)
    end
  end
end
