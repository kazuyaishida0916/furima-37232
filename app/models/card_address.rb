class CardAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number
    validates :item_id
    validates :user_id
  end
  
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } 


  def save
    card = Card.create(item_id: item_id, user_id: user_id)
    Shipaddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, card_id: card.id)
  end
end

# item_controller - (attr_accessor) - item.rb - items table

# matome_controller - attr_accessor - まとめ役 matome.rb（どのカラムをどのテーブルに保存するか）- save - cards table / ship_addresses table
# orders_controller(@card_address = CardAddress.new)

