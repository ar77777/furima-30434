require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '出品の購入' do
    context '出品の購入ができる場合' do
      it 'postal,prefecture_id,city,block,phone_number,tokenが存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが存在しない場合でも購入できる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '出品の購入ができない場合' do
      it 'postalが存在しない場合保存できない' do
        @purchase_address.postal = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal can't be blank", 'Postal is invalid')
      end
      it 'prefecture_idが存在しない場合保存できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefecture_idがid1の場合保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが存在しない場合保存できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが存在しない場合保存できない' do
        @purchase_address.block = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが存在しない場合保存できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it 'phone_numberにハイフンがある場合保存できない' do
        @purchase_address.phone_number = '000-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが存在しない場合保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
