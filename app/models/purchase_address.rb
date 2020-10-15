class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :block, :building_name, :phone_number, :token, :user_id, :item_id

  validates :prefecture_id, :city, :block, :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1 } 
  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end