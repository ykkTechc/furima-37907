class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :move_to_index, only: [:edit, :update,]


  def index
    @items = Item.all.order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
      redirect_to root_path
  end

  private

 def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
 end

 def set_item
   @item = Item.find(params[:id])
 end

 def move_to_index
   redirect_to root_path unless current_user == @item.user
 end

end

