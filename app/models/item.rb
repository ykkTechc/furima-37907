class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :sipping_fee
  belongs_to :status

  has_one_attached :image


  validates :category,    numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :send_day,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_fee, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status,      numericality: { other_than: 1 , message: "can't be blank"}
end
