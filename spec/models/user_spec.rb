require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ログインできる時' do
      it "nickname、first_name、last_name、first_name_kana、last_name_kana、birthday
          email、password、password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = "test@test.com"
        expect(@user).to be_valid
      end
      it "パスワードが必須であること" do
        @user.password = "11111q"
        @user.password_confirmation = "11111q"
        expect(@user).to be_valid
      end
      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = "11111q"
        @user.password_confirmation = "11111q"
        expect(@user).to be_valid
      end
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        @user.password = "11111q"
        @user.password_confirmation = "11111q"
        expect(@user).to be_valid
      end
    end

    context 'ログインできない時' do
      it "emailが空であれば登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がなければ登録できない" do
        @user.email = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is too short (minimum is 6 characters)", 
        "Password is invalid", "Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
          "Password is too short (minimum is 6 characters)",
          "Password is too short (minimum is 6 characters)",
          "Password is invalid")
      end
      it "passwordとpassword_confirmationの値が不一致の場合、登録できない" do
        @user.password = "11111q"
        @user.password_confirmation = "qqqqq1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end