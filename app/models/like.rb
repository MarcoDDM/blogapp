class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
