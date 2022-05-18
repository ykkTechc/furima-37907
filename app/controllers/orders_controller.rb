class OrdersController < ApplicationController

before_action :authenticate_user!, only:[:index]
before_action :set_order, only: [:index]
before_action :move_to_index, only: [:index] 

def index
  @order_delivery = OrderDelivery.new
  @item = Item.find(params[:item_id])
  
end

def create
  @item = Item.find(params[:item_id])
  @order_delivery = OrderDelivery.new(order_params)
  if @order_delivery.valid?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'                 
    )
    @order_delivery.save
    return redirect_to root_path
  else
    render :index
  end
end

private

def set_order
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order_delivery).permit(:order_delivery ,:post, :prefecture_id, :town, :address, :building, :tele_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end

def move_to_index
  redirect_to root_path if current_user == @item.user ||  @item.order.present? 
end

end

# ①if ログインしている人 == 出品者 
# ②if 出品から紐づく購入情報が存在している

# ①と②は|| や &&でつなげても良い
#売れてるかどうかの判断。
#@item.order売れてる
#オーダーの情報を持っていてはいけない
#オーダーの情報を持ってるか、持ってないかで判断する。
#出品者　@item.user ルートパスに戻ってしまう。

