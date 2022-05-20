class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  VALID_READ_REGEX = /\A[ァ-ヶー-]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname,         presence: true
  
  with_options presence: true do
    validates :password,       presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :family_name,    presence: true, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :first_name,     presence: true, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :read_family,    presence: true, format: { with: VALID_READ_REGEX, message: 'Full-width characters.' }
    validates :read_first,     presence: true, format: { with: VALID_READ_REGEX, message: 'Full-width characters.' }
  end
  validates :birth, presence: true

  #has_many :items
  #has_many :item_purchases
end
