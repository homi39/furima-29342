require 'rails_helper'

RSpec.describe OrderLocation, type: :model do
  describe '商品を購入する' do
    before do
      @order_location = FactoryBot.build(:order_location)
    end

    it '全ての値が正しく入力されていれば購入できる' do
      expect(@order_location).to be_valid
    end
    it 'クレジットカード情報が空では購入できない' do
      @order_location.token = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では購入できない' do
      @order_location.postal_code = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が選択されていないと購入できない' do
      @order_location.shipping_area_id = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '市区町村が空では購入できない' do
      @order_location.city = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入できない' do
      @order_location.block = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Block can't be blank")
    end
    it '建物名は空でも購入できる' do
      @order_location.building = nil
      expect(@order_location).to be_valid
    end
    it '電話番号が空では購入できない' do
      @order_location.phone_number = nil
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号はハイフンがないと購入できない' do
      @order_location.postal_code = '1234567'
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Postal code is invalid')
    end
    it '電話番号にハイフンがあると購入できない' do
      @order_location.phone_number = '090-1234-5678'
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が11桁を超えると購入できない' do
      @order_location.phone_number = '090123456789'
      @order_location.valid?
      expect(@order_location.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end
