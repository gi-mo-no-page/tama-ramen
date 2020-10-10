require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    before do
      @category = FactoryBot.build(:category)
    end

    #it 'nameが存在すれば登録できること' do
      #expect(@catrgory).to be_valid
    #end

    it 'nameが空では登録できないこと' do
      @category.name = nil
      @category.valid?
      expect(@category.errors.full_messages).to include("Name can't be blank")
    end
  end
end
