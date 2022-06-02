class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,   format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid', allow_blank: true }
    validates :token
  end

    def save
      item_purchase = ItemPurchase.create(user_id: user, item_id: item)
      
      Address.create(item_purchase: item_purchase, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
    end
  
end 