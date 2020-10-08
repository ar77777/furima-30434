require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
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

    context '新規登録できない時' do
      it "nicknameが空であれば登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
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
      it "重複するemailが存在する場合に登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
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
      it "passwordが半角英字のみであれば登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが数字のみであれば登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "確認用passwordがない場合登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationの値が不一致の場合、登録できない" do
        @user.password = "11111q"
        @user.password_confirmation = "qqqqq1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空であれば登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "first_nameが空であれば登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_nameが漢字・ひらがな・カタカナ以外で入力された場合登録できない" do
        @user.last_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが漢字・ひらがな・カタカナ以外で入力された場合登録できない" do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空であれば登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "first_name_kanaが空であれば登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "last_name_kanaがカタカナ以外で入力された場合登録できない" do
        @user.last_name_kana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaがカタカナ以外で入力された場合登録できない" do
        @user.first_name_kana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end