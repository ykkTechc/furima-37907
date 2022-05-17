class OrdersController < ApplicationController

before_action :set_order, only: [:index]

def index
  @order_delivery = OrderDelivery.new
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


end
