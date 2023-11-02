class Comment < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post

  after_create :update_post_comments_counter

  validates :text, presence: true

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
