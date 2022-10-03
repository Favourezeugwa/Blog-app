require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Favour',
      bio: 'Fashion Designer',
      photo: 'http://hello.com',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Makkie',
      bio: 'Italian Chef',
      photo: 'http://makkie.com',
      posts_counter: 5
    )
  end

  describe 'users index page' do
    it 'shows the right username' do
      visit users_path
      expect(page).to have_content('Favour')
      expect(page).to have_content('Makkie')
      expect(page).to_not have_content('Melinda')
    end

    it 'shows the right photo' do
      visit users_path
      expect(page).to have_css("img[src*='http://hello.com']")
      expect(page).to have_css("img[src*='http://makkie.com']")
    end

    it 'shows the right Number of posts' do
      visit users_path
      expect(page).to have_content('Number of Posts: 2')
      expect(page).to have_content('Number of Posts: 5')
    end

    it 'shows the user_path when clicked' do
      visit users_path
      click_link 'Favour'
      expect(page).to have_current_path(user_path(@user))
    end

    it 'renders a bio content in show path' do
      visit users_path
      click_link 'Favour'
      expect(page).to have_content('Fashion Designer')
    end
  end
end
