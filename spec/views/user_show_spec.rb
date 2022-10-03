require 'rails_helper'

RSpec.describe 'User Show' do
  before(:each) do
    @user1 = User.create(
      name: 'Favour',
      bio: 'Fashion Designer',
      photo: 'http://hello.com',
      posts_counter: 2
    )

    @post1 = Post.create(
      user_id: @user1.id,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 2
    )

    @post2 = Post.create(
      user_id: @user1.id,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  describe 'a user show page' do
    it 'displays the user\'s profile photo' do
      visit user_path
      expect(page).to have_css("img[src*='http://hello.com']")
    end
  end
end
