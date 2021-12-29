class CardAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    card = Card.create(item_id: item_id, user_id: user_id)
    Shipaddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, card_id: card.id)
  end
end
