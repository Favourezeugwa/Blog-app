module ApplicationHelper
  def available_comments?(post)
    if post.comments_counter.zero?
      'No comments added!'
    else
      post.comments
    end
  end

  def available_posts(user)
    if user.posts_counter.zero?
      'No posts added!'
    else
      user.posts
    end
  end
end
