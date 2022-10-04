require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Amarachi',
      bio: 'Product Manager',
      photo: 'http://product.com',
      posts_counter: 0
    )

    @user2 = User.create(
      name: 'Makkie',
      bio: 'Italian Chef',
      photo: 'http://makkie.com',
      posts_counter: 5
    )

    @post1 = Post.create(
      users: @user1,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'What an amazing time to be alive!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Welcome micronauts!')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Congrats all, award well deserved.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Peace all round.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Hello world Favour')

    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post1.id, user_id: @user2.id)
  end
