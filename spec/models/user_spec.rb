require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '新規登録全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@を含まないemailだと登録できない' do
        @user.email = 'aaaaaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '00aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '1234abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが全角入力でなければ登録できない' do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters.')
      end
      it 'first_nameとが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角入力でなければ空では登録できない' do
        @user.first_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters.')
      end
      it 'read_familyが空では登録できない' do
        @user.read_family = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end
      it 'read_familyが全角（カタカナ）でなければ登録できない' do
        @user.read_family = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read family Full-width characters.')
      end
      it 'read_firstが空では登録できない' do
        @user.read_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end
      it 'read_firstが全角（カタカナ）でなければ登録できない' do
        @user.read_first = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first Full-width characters.')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
