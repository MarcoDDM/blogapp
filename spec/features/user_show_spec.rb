require 'rails_helper'

RSpec.describe 'User integration tests', type: :feature do
  before do
    User.create(id: 1, name: 'John', photo: 'https://picsum.photos/200/300', bio: 'Pitcher from Mexico.', posts_counter: 0)
  end

  def all_users
    User.all
  end

  describe 'users index' do
    it 'displays the user name of all users' do
      visit users_path
      all_users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays the user image of all users' do
      visit users_path
      all_users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'displays the post amount of all users' do
      visit users_path
      all_users.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    it 'redirected to users page (users-show)' do
      visit users_path
      all_users.each do |user|
        click_link user.name
        expect(page).to have_current_path(user_path(user))
        visit users_path
      end
    end
  end
end
