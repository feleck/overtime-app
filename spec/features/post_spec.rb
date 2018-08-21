require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(
      email: 'test1@test.com',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf',
      first_name: 'John',
      last_name: 'Maklowicz'
    )
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: 'Anything', user: @user)
      post2 = Post.create(date: Date.today, rationale: 'Again', user: @user)
      visit posts_path
      expect(page).to have_content(/Anything|Again/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Anything'
      click_on 'Save'
      expect(page).to have_content('Anything')
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'
      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end
end
