class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,       presence: true
         validates :family_name,    presence: true
         validates :first_name,     presence: true
         validates :read_family,    presence: true
         validates :read_first,     presence: true
         validates :birth,          presence: true

         has_many :items
         has_many :item_purchases
end
