require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:tom) { User.create(name: 'Tom', posts_counter: 0) }
  let(:post) do
    Post.create(author_id: tom.id, title: 'Title', text: 'Great post!', comments_counter: 0, likes_counter: 0)
  end

  it 'is valid with valid attributes' do
    comment = Comment.new(text: 'Great post!', author_id: tom.id, post:)
    expect(comment).to be_valid
  end

  it 'is invalid without text' do
    comment = Comment.new(author_id: tom.id, post_id: post.id)
    expect(comment).to_not be_valid
  end

  it 'is invalid without an author' do
    comment = Comment.new(text: 'Great post!', post_id: post.id)
    expect(comment).to_not be_valid
  end

  it 'is invalid without a post' do
    comment = Comment.new(text: 'Great post!', author_id: tom.id)
    expect(comment).to_not be_valid
  end
end
