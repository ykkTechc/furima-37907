require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '商品購入機能の実装' do
    context '商品出品ができる場合' do

      it 'すべての情報があれば保存できる' do
        expect(@order_delivery).to be_valid
      end
      
      it 'buildingは空でも保存できること' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end

    end

    context '商品出品ができない場合' do

      it '郵便番号が空だと保存できないこと' do
        @order_delivery.post =''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.post = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_delivery.prefecture_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村を選択していないと保存できないこと' do
        @order_delivery.town = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Town can't be blank")
      end
      it '住所を選択していないと保存できないこと' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号を入力していないと保存できないこと' do
        @order_delivery.tele_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tele number can't be blank")
      end
      it "トークンが空では登録できないこと" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
