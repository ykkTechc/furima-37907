class OrdersController < ApplicationController

before_action :authenticate_user!, only:[:index]
before_action :set_order, only: [:index]
before_action :move_to_index, only: [:index, :create] 

def index
  @order_delivery = OrderDelivery.new
end

def create
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


