require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  it 'すべての情報があれば保存できる' do
    expect(@user).to be_valid
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emaiは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'lastnameが空では登録できない' do
      @user.lastname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it 'lastnameが漢字・ひらがな・カタカナでないと保存できない' do
      @user.lastname = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
    end
    it 'sub_lastnameが空では登録できない' do
      @user.sub_lastname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Sub lastname can't be blank")
    end
    it 'sub_lastnameが全角カタカナでないと保存できない' do
      @user.sub_lastname = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sub lastname is invalid. Input full-width katakana characters.')
    end
    it 'nameが空では登録できない' do
      @user.name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが漢字・ひらがな・カタカナでないと保存できない' do
      @user.name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
    end
    it 'sub_nameが空では登録できない' do
      @user.sub_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Sub name can't be blank")
    end
    it 'sub_nameが全角カタカナでないと保存できない' do
      @user.sub_name = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sub name is invalid. Input full-width katakana characters.')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationの値の一致が必須' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
