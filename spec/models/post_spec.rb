require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date work performed and daily hours ' do
      @post.date = nil
      @post.work_performed = nil
      @post.daily_hours = nil
      expect(@post).not_to be_valid
    end

    it 'has an daily hours greater than 0.0' do
      @post.daily_hours = 0.0
      expect(@post).not_to be_valid
    end
  end
end
