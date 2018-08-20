require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      user = User.create(
        email: 'test@test.com',
        password: 'asdfasdf',
        password_confirmation: 'asdfasdf',
        first_name: 'John',
        last_name: 'Maklowicz'
      )
      @post = Post.create(date: Date.today, rationale: 'Late hours!', user: user)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end
    it 'cannot be created without a date and rational' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).not_to be_valid
    end
  end
end
