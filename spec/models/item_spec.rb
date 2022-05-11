require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が出品できる場合" do
      it "全ての情報があれば出品される" do
        expect(@item).to be_valid
      end
    end

    context "テキストが出品できない場合" do
    it "画像が空では商品は保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "タイトルが空では商品は出品できない" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品説明が空では出品できない" do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーが空では出品できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空では出品できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料が空では出品できない" do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it "配送元が空では出品できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "配送日が空では出品できない" do
      @item.send_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Send day can't be blank")
    end
    it "価格が空では出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格に半角数字以外が含まれている場合は出品出来ない" do
      @item.price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "価格が300円未満では出品出来ない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "価格が、9999999円を超えると出品出来ない" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end


    it "ユーザーが紐付いていないと商品は保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
  end
end
