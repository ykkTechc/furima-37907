# class ItemsController < ApplicationController
#   before_action :authenticate_user!, except:[:index]
#  

#   def index
#     @items = Item.includes(:user)
#   end
  
#   def new
#     @item = Item.new
#   end

#   def create
#     @item = Item.new(item_params) 
#     if @item.save
#       redirect_to root_path
#     else
#       render :new
#     end
#   end

#   private

#  def item_params
#     items.require(:item).permit(:title, :explanation, :category_id, :status_id, :sipping_fee_id, :prefecture_id, :send_day_id, :price, :image)
#  end







  
# end
