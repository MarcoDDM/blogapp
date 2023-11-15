require 'rails_helper'

RSpec.describe User, type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:tom) do
    User.create(
      name: 'Tom Jenkins',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqI5QUajL66Kkwz9efY-xCyC_Bq97XyTvgPmndMocETt62-ps3VjrzLtWNrDq_Y5qa5fQ',
      bio: 'I\'m Tom, and I thrive on the thrill of innovation and creativity.',
      posts_counter: 0
    )
  end

  let(:nancy) do
    User.create(
      name: 'Nancy Wheeler',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5NAZBo2UrrQpRlk5paG6I23mWYsoSSXA-qw',
      bio: 'Hi there, I\'m Nancy! I\'m not just your typical actress;',
      posts_counter: 0
    )
  end

  let(:jane) do
    User.create(
      name: 'Jane Mute',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm48hud8Rmxfcr21GAjCeqJ2PfS-foEjPbcQ&usqp=CAU',
      bio: 'Hi there, I\'m Jane! I thrive on embracing life.',
      posts_counter: 0
    )
  end

  let(:brian) do
    User.create(
      name: 'Brian Tally',
      photo: 'https://static.wikia.nocookie.net/familyguy/images/c/c2/FamilyGuy_Single_BrianWriter_R7.jpg',
      bio: 'Hey there, I\'m Brian! I\'m a fun-loving individual with an infectious sense of humor.',
      posts_counter: 0
    )
  end

  let(:first_post) do
    Post.create(
      author: brian,
      title: 'Welcome to my blog',
      text: 'This is my first post',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  let(:second_post) do
    Post.create(
      author: brian,
      title: 'Welcome to my second post',
      text: 'This is my second post',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  let(:third_post) do
    Post.create(
      author: brian,
      title: 'Welcome to my third post',
      text: 'This is my third post',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  before do
    tom
    nancy
    jane
    brian
  end

  context 'index page test group 1' do
    before { visit root_path }

    it 'shows the username of each user' do
      expect(page).to have_content(tom.name)
      expect(page).to have_content(nancy.name)
      expect(page).to have_content(jane.name)
      expect(page).to have_content(brian.name)
    end

    it 'shows the profile picture of each user' do
      profile_pictures = all('.user-image.border')

      expect(profile_pictures[0]).to be_visible
      expect(profile_pictures[1]).to be_visible
      expect(profile_pictures[2]).to be_visible
      expect(profile_pictures[3]).to be_visible
      expect(profile_pictures[0]['src']).to eq tom.photo
      expect(profile_pictures[1]['src']).to eq nancy.photo
      expect(profile_pictures[2]['src']).to eq jane.photo
      expect(profile_pictures[3]['src']).to eq brian.photo
    end
  end

  context 'index page test group 2' do
    before { visit root_path }

    it 'shows the number of posts each user has written' do
      user_tiles = all('.card')
      user_tiles.each do |user_tile|
        expect(user_tile).to have_content(/\d+ Post/)
      end
    end

    it 'redirects to a user\'s show page on click' do
      click_link tom.name
      toms_show_page_url = user_path(id: tom.id)
      expect(page).to have_current_path(toms_show_page_url)
    end
  end

  context 'show page test group 1' do
    subject { brian }
    before do
      first_post
      second_post
      third_post
      visit user_path(subject)
    end

    it 'shows the user profile picture' do
      profile_picture = find('.user-image')
      expect(profile_picture).to be_visible
      expect(profile_picture['src']).to eq subject.photo
    end

    it 'shows the user\'s name' do
      expect(page).to have_content(subject.name)
    end
    it 'shows the number of posts the user has written' do
      expect(page).to have_content("#{subject.posts_counter} Post#{subject.posts_counter == 1 ? '' : 's'}")
    end
    it 'shows the user bio' do
      expect(page).to have_content("Brian Tally\n3 Posts\nAdd a post\n@@ -19,19 +19,19 @@\nWelcome to my blog\nThis is my first post\nComments: 0 Likes: 0\nWelcome to my second post\nThis is my second post\nComments: 0 Likes: 0\nWelcome to my third post\nThis is my third post\nComments: 0 Likes: 0\nSee all posts")
    end

    it 'shows the user\'s first three posts' do
      expect(page).to have_content(subject.posts[0].title)
      expect(page).to have_content(subject.posts[1].title)
      expect(page).to have_content(subject.posts[2].title)
    end

    it 'shows a button that shows all the user\'s posts when clicked' do
      expect(page).to have_link('See all posts')
    end
  end

  context 'show page test group 2' do
    subject { brian }
    before do
      first_post
      second_post
      third_post
      visit user_path(subject)
    end

    it 'redirects to the show page of a post when it is clicked' do
      first_post_url = user_post_path(user_id: subject.id, id: subject.posts.first.id)

      click_link subject.posts.first.title

      expect(page).to have_current_path(first_post_url)
      expect(page).to have_content(subject.posts.first.title)
      expect(page).to have_content(subject.posts.first.text)
    end

    it 'redirects to the post\'s index page when the \'See all posts\' link is clicked' do
      all_posts_url = user_posts_path(user_id: subject.id)

      click_link 'See all posts'
      expect(page).to have_current_path(all_posts_url)
    end
  end
end
