require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe '#create' do
    before do
      @menu = FactoryBot.build(:menu)
    end

    #it 'name,price,user_id,shop_idが存在すれば登録できること' do
      #expect(@menu).to be_valid
    #end

    it 'nameが空では登録できないこと' do
      @menu.name = nil
      @menu.valid?
      expect(@menu.errors.full_messages).to include("Name can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @menu.price = nil
      @menu.valid?
      expect(@menu.errors.full_messages).to include("Price can't be blank")
    end
  end
end
