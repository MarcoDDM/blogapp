require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) do
    User.create(name: 'Adnan', photo: 'https://unsplash.com/photos/ABC123', posts_counter: 5)
  end

  let!(:post) do
    Post.create(title: 'My First Post', text: 'This is my first post', author: user, comments_counter: 0,
                likes_counter: 0)
  end

  let!(:comment) do
    Comment.create(text: 'This is my first comment', author: user, post:)
  end

  it "displays the user's profile picture on user posts page" do
    visit users_path(user_id: user.id)
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  it "displays the user's name on user posts page" do
    visit users_path(user_id: user.id)
    expect(page).to have_content(user.name)
  end

  it "displays the user's post count on user posts page" do
    visit users_path(user_id: user.id)
    expect(page).to have_content(user.posts_counter)
  end

  it 'displays a post title on user posts page' do
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(post.title)
  end

  it 'displays a post text on user posts page' do
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(post.text)
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(comment.text)
  end

  it 'displays the number of comments on a post' do
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(post.comments_counter)
  end

  it 'displays the number of likes on a post' do
    visit user_posts_path(user_id: user.id)
    expect(page).to have_content(post.likes_counter)
  end

  it 'redirects to post show page when clicking on post title' do
    visit user_posts_path(user_id: user.id)
    click_link post.title
    expect(page).to have_current_path(user_post_path(user_id: user.id, id: post.id))
  end
end
