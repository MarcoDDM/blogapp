require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:tom) { User.create(name: 'Tom', posts_counter: 0) }

  it 'is valid with valid attributes' do
    post = Post.new(
      title: 'Title',
      comments_counter: 0,
      likes_counter: 0,
      author: tom
    )
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(
      comments_counter: 0,
      likes_counter: 0,
      author: tom
    )
    expect(post).to_not be_valid
  end

  it 'is invalid with a title exceeding 250 characters' do
    title = 'a' * 251
    post = Post.new(
      title: title,
      comments_counter: 0,
      likes_counter: 0,
      author: tom
    )
    expect(post).to_not be_valid
  end

  it 'is invalid with a negative comments_counter' do
    post = Post.new(
      title: 'Title',
      comments_counter: -1,
      likes_counter: 0,
      author: tom
    )
    expect(post).to_not be_valid
  end

  it 'is invalid with a negative likes_counter' do
    post = Post.new(
      title: 'Title',
      comments_counter: 0,
      likes_counter: -1,
      author: tom
    )
    expect(post).to_not be_valid
  end

  it 'is invalid without an author' do
    post = Post.new(
      title: 'Title',
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to_not be_valid
  end
end
