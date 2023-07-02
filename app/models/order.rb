class Order < ApplicationRecord
  belongs_to :buyer_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
