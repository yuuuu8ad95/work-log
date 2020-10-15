require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    before do
      @user = FactoryBot.build(:user)
      @user.image = fixture_file_upload('public/images/human_image.png')
    end

    context 'ユーザー登録ができる場合' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordは半角英数混合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end

      it 'passwordは6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end

      it '誕生日の欄が空の場合でも登録できる' do
        @user.birthday = ""
        @user.valid?
        expect(@user).to be_valid
      end

      it '趣味の欄が空の場合でも登録できる' do
        @user.hobby = ""
        @user.valid?
        expect(@user).to be_valid
      end

      it '自由の欄が空の場合でも登録できる' do
        @user.free = ""
        @user.valid?
        expect(@user).to be_valid
      end

      it '画像の欄が空の場合でも登録できる' do
        @user.image = ""
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it 'emailに@がない場合、登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'passwordは6文字以下では登録できない' do
        @user.password = '12ab'
        @user.password_confirmation = '12ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'パスワードに数字が含まれない場合、登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
  
      it 'パスワードに英字が含まれない場合、登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
  
      it '本名のカタカナは半角では登録できない' do
        @user.first_name_kana = 'ｱｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '担当の選択がされていないと登録できない' do
        @user.department_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Department Select')
      end 
    end
  end
end
