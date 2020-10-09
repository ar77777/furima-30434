require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品内容の保存' do
    context '出品内容が保存できる場合' do
      it 'name,description,category_id,condition_id,buyer_burden_id,prefecture_id,delivery_time_id,price,imageが存在すれば保存される' do
        expect(@item).to be_valid
      end
    end
    context '出品内容が保存できない場合' do
      it 'nameが存在しない場合保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが存在しない場合保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが存在しない場合保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idの値が1の場合場合保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが存在しない場合保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it 'condition_idの値が1の場合場合保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'buyer_burden_idが存在しない場合保存できない' do
        @item.buyer_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Buyer burden is not a number')
      end
      it 'buyer_burden_idの値が1の場合場合保存できない' do
        @item.buyer_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Buyer burden must be other than 1')
      end
      it 'prefecture_idが存在しない場合保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idの値が1の場合場合保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'delivery_time_idが存在しない場合保存できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time is not a number')
      end
      it 'delivery_time_idの値が1の場合場合保存できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time must be other than 1')
      end
      it 'priceが存在しない場合保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is invalid')
      end
      it 'priceの値が300未満の場合保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceの値が10000000以上の場合保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが半角数字以外の場合保存できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが存在しない場合保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
