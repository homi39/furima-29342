require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品を出品する' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての値が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
    it 'ログインしていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '画像が空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーが選択されていないと出品できない' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が選択されていないと出品できない' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担が選択されていないと出品できない' do
      @item.shipping_cost = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it '発送元の地域が選択されていないと出品できない' do
      @item.shipping_area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.scheduled_shipping_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled shipping date can't be blank")
    end
    it '価格が空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が300〜9,999,999円の間でなければ出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters within 300-9,999,999')
    end
    it '価格は半角数字でなければ出品できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters within 300-9,999,999')
    end
  end
end
