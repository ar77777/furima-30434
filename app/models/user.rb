class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  新規登録/ユーザー情報
         validates :nickname, presence: true
         validates :password, length: { minimum: 6 }
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX 

        #  新規登録/本人情報確認
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
          validates :last_name, presence: true
          validates :first_name, presence: true
         end
         with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
          validates :last_name_kana, presence: true
          validates :first_name_kana, presence: true
         end
         validates :birthday, presence: true
end
