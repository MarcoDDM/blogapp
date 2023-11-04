require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:tom) { User.create(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(title: 'Title', comments_counter: 0, likes_counter: 0, author: tom) }

  it 'is valid with valid attributes' do
    like = Like.new(author: tom, post:)
    expect(like).to be_valid
  end
end
