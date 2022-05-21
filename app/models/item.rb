class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :postage_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :preparation_days_id
  

  validates :image,                presence: true
  validates :product,              presence: true
  validates :explanation,          presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :preparation_days_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  
end
