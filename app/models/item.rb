class Item < ApplicationRecord
  validates :name, :description, :category_id, :condition_id, :buyer_burden_id, :prefecture_id, :delivery_time_id, :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 300, less_than: 10000000}
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX 

  #Activehash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :buyer_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

  validates :category_id,:condition_id, numericality: { other_than: 1 } 

  #ActiveStorage
  has_one_attached :image
end
