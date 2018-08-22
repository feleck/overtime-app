require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @post = FactoryBot.create(:post)
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
