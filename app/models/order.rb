class Order < ApplicationRecord
  belongs_to :buyer_records
  belongs_to :prefecture
end
