class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_days

  validates :image,                presence: true
  validates :product,              presence: true
  validates :explanation,          presence: true
  validates :category_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :preparation_days_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,                presence: true,
                                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
