class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :shipping_fee
  belongs_to :status
  belongs_to :user
  
  has_one_attached :image
 
  validates :price,           presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image,           presence: true
  validates :title,           presence: true
  validates :explanation,     presence: true
  validates :category_id,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_day_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,       numericality: { other_than: 1 , message: "can't be blank"}
end
