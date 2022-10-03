class Like < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
  after_save :update_likes_counter

  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :post_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def update_likes_counter
    posts.increment!(:likes_counter)
  end
end
