require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_posts_index_url
    assert_response :success
  end
end
