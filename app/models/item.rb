class Item < ApplicationRecord
  belongs_to :user
  # has_many :buyer_records
  has_one_attached :image
end
