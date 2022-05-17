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

    end
  end
end
