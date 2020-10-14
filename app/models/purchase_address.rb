class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :block, :building_name, :phone_number, :token, :user_id, :item_id

  # あとで編集
  validates :token, presence: true
  validates :postal, :prefecture_id, :city, :block, :phone_number, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end