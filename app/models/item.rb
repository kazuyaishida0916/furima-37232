class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :user
  has_one_attached :image
  has_one :card

  validates :image, presence: true
  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_name, presence: true
  validates :item_detail, presence: true

  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_days_id, numericality: { other_than: 0, message: "can't be blank" }
end
