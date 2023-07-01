class OrderBuyerRecord
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :buyer_record_id, :user_id, :item_id 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    buyer_record = BuyerRecord.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buyer_record_id: buyer_record.id)
  end

end