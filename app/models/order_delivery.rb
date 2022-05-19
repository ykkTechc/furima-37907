class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post, :town, :address, :building, :tele_number, :prefecture_id, :user_id, :item_id, :token

  with_options presence: true do
     validates :post          , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :town          
     validates :address       
     validates :tele_number   ,format: {with:/\A\d[0-9]{10,11}\z/, message: "can't be blank"}
     validates :user_id
     validates :item_id
     validates :token
  end
     validates :prefecture_id , numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(item_id:item_id, user_id:user_id)
    Derivery.create(post:post, prefecture_id:prefecture_id, town:town, address:address, building:building, tele_number:tele_number, order_id:order.id)
  end
end
