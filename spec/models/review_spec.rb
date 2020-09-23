require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#create' do
    before do
      @review = FactoryBot.build(:review)
    end

    it 'title,text,rate,user_id,shop_idが存在すれば登録できること' do
      expect(@review).to be_valid
    end

    it 'titleが空では登録できないこと' do
      @review.title = nil
      @review.valid?
      expect(@review.errors.full_messages).to include("Title can't be blank")
    end

    it 'textが空では登録できないこと' do
      @review.text = nil
      @review.valid?
      expect(@review.errors.full_messages).to include("Text can't be blank")
    end

    it 'rateが空では登録できないこと' do
      @review.rate = nil
      @review.valid?
      expect(@review.errors.full_messages).to include("Rate can't be blank")
    end
  end
end
