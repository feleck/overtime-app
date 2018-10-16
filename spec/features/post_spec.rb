require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryBot.create(:user) }
  let(:post) do
    Post.create(
      date: Date.today,
      work_performed: 'Yet another',
      user_id: user.id,
      daily_hours: 2.5
    )
  end
  before do
    login_as(user, scope: :user)
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
      FactoryBot.create(:post)
      FactoryBot.create(:second_post)
      # TODO, Refactor!
      Post.first.update(user_id: user.id)
      visit posts_path
      expect(page).to have_content(/Anything|Other|another/)
    end

    it 'has a scope so that only post creators can see their posts' do
      FactoryBot.create_list(:post, 5)
      other_user_post = FactoryBot.create(:post_form_other_user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      other_user_post.update(user_id: non_authorized_user.id)
      # TODO, Refactor
      visit posts_path
      expect(page).not_to have_content(/another/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      employee = FactoryBot.create(:employee)
      login_as(employee, scope: :user)
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
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
      fill_in 'post[work_performed]', with: 'Anything'
      fill_in 'post[daily_hours]', with: 1.3
      expect{ click_on 'Save' }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_performed]', with: 'User Association'
      fill_in 'post[daily_hours]', with: 1.3
      click_on 'Save'
      expect(User.last.posts.last.work_performed).to eq('User Association')
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_performed]', with: 'Edited content'
      click_on 'Save'
      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      deleting_user = FactoryBot.create(:user)
      login_as(deleting_user, scope: :user)
      post_to_delete = Post.create(
        date: Date.today,
        work_performed: 'Dationale',
        user_id: deleting_user.id,
        daily_hours: 8
      )
      visit posts_path
      click_link("delete_#{post_to_delete.id}")
      expect(page.status_code).to eq(200)
    end
  end
end
