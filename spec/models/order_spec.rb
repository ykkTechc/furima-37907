require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能の実装' do
    context '商品出品ができる場合' do

      it 'すべての情報があれば保存できる' do
        expect(@order).to be_valid
      end

    end
  end 

end
