class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
  

  validates :image,                presence: true
  validates :product,              presence: true
  validates :explanation,          presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :postage_id,           presence: true
  validates :prefecture_id,        presence: true
  validates :preparation_days_id,  presence: true
  validates :price,                presence: true
end
