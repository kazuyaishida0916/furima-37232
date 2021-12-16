class Item < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  has_one_attached :image
   #空の投稿を保存できないようにする
   validates :title, :text, presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"} 
   validates :shipping_day_id, numericality: { other_than: 0 , message: "can't be blank"}
end
