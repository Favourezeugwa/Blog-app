require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Amarachi',
      bio: 'Product Manager',
      photo: 'http://product.com',
      posts_counter: 0
    )

    @post1 = Post.create(
      users: @user1,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      users: @user1,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Hi everytone, nice to meet you!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Hello loves, welcome!!')
    Comment.create(post_id: @post2.id, user_id: @user1.id, text: 'How are you?, been a while')

    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post2.id, user_id: @user1.id)
  end

end
