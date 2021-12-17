class Item < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  has_one_attached :image
   #空の投稿を保存できないようにする
   validates :image, presence: true
   validates :item_name, presence: true, length: { maximum: 40 }
   validates :item_detail, presence: true, length: { maximum: 10000 }

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"} 
   validates :shipping_days_id, numericality: { other_than: 0 , message: "can't be blank"}
end
