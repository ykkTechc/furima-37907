class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post, :town, :address, :building, :tele_number, :prefecture_id, :user_id, :item_id, :token

  with_options presence: true do
     validates :post           
     validates :town           
     validates :address       
     validates :tele_number   
     validates :token
  end
     validates :prefecture_id , numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(item_id:item_id, user_id:user_id)
    Derivery.create(post:post, prefecture_id:prefecture_id, town:town, address:address, building:building, tele_number:tele_number, order_id:order.id)
  end
end
