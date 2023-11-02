class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_author_posts_counter

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, allow_nil: true },
                               comparison: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, allow_nil: true },
                            comparison: { greater_than_or_equal_to: 0, allow_nil: true }

  def update_author_posts_counter
    author.update_posts_counter
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end

  def recent_comments
    comments.order(created_at: :desc).includes([:author]).limit(5)
  end
end
