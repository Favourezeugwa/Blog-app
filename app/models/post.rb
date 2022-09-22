class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def update_post_counter
    user.increment!(:post_counter)
  end

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
