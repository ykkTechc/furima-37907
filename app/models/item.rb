class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :shipping_fee
  belongs_to :status
  
  
  has_one_attached :image
 
  validates :price,        presence: true
  validates :image,        presence: true
  validates :title,        presence: true
  validates :explanation,  presence: true
  validates :category_id,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_day_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,       numericality: { other_than: 1 , message: "can't be blank"}
end
