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
  
  describe 'A specific post with title, comments and counter' do
    it 'displays the post title' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('First post')
    end

    it 'displays the post title and user who wrote the post' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('First post by Amarachi')
    end
    
    it 'displays total comments and likes' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Comments: 5, Likes: 2')
    end

    it 'shows other parts of the post body' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('This is my first post')
    end

    it 'shows username and comment of each commentor' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Amarachi: What an amazing time to be alive!')
      expect(page).to have_content('Amarachi: Welcome micronauts!')
      expect(page).to have_content('Makkie: Peace all round.')
    end
  end
end
