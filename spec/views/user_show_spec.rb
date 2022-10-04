require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
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
      comments_counter: 1,
      likes_counter: 3
    )

    @post2 = Post.create(
      users: @user1,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 2,
      likes_counter: 2
    )
  end

  describe 'a user show page' do
    it 'displays the users profile photo' do
      visit user_path(@user1)
      expect(page).to have_css("img[src*='http://product.com']")
    end
  end

  it 'displays the user name' do
    visit user_path(@user1)
    expect(page).to have_content('Amarachi')
  end

  it 'displays the user bio' do
    visit user_path(@user1)
    expect(page).to have_content('Product Manager')
  end

  it 'shows the right Number of posts' do
    visit user_path(@user1)
    expect(page).to have_content('Number of Posts: 2')
  end

  it 'shows all the available users posts' do
    visit user_path(@user1)
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
  end

  it 'shows a button that helps view all of a users posts' do
    visit user_path(@user1)
    expect(page).to have_content('see all posts')
  end

  it 'click to see all posts, it redirects to the users posts index page' do
    visit user_path(@user1)
    click_link 'see all posts'
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  it 'click a users post, it redirects to the posts show page' do
    visit user_path(@user1)
    click_link 'First post'
    expect(page).to have_current_path(user_post_path(@user1, @post1))
  end

  it 'click a users post, it redirects to the posts show page' do
    visit user_path(@user1)
    click_link 'Second post'
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end
end
