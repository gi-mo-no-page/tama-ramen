require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    before do
      @shop = FactoryBot.build(:shop)
    end

    it "name,text、address,latitude,longitude,category_id,user_id,imageが存在すれば登録できること" do
      expect(@shop).to be_valid
    end

    it "nameが空では登録できないこと" do
      @shop.name = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Name can't be blank")
    end

    it "textが空では登録できないこと" do
      @shop.text = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Text can't be blank")
    end

    it "addressが空では登録できないこと" do
      @shop.address = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Address can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @shop.category_id = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Category can't be blank")
    end

    it "imageが空では登録できないこと" do
      @shop.image = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Image can't be blank")
    end



  end
end