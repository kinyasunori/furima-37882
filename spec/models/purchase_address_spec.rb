require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
      @purchase_address = FactoryBot.build(:purchase_address,user: user, item: item )
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'userが空でなければ保存できる' do
        @purchase_address.user = 1
        expect(@purchase_address).to be_valid
      end
      it 'itemが空でなければ保存できる' do
        @purchase_address.item = 1
        expect(@purchase_address).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @purchase_address.postal_code = '123-4560'
        expect(@purchase_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @purchase_address.prefecture_id = 2
        expect(@purchase_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @purchase_address.city = '大阪市'
        expect(@purchase_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @purchase_address.address = '加美北1-11'
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @purchase_address.phone_number = 12_345_678_910
        expect(@purchase_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'userが空だと保存できない' do
        @purchase_address.user = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが空だと保存できない' do
        @purchase_address.item = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @purchase_address.postal_code = 1_234_567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @purchase_address.phone_number = '123 - 1234 - 1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @purchase_address.phone_number = 123_456_789
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @purchase_address.phone_number = 12_345_678_910_123_111
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
