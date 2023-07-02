FactoryBot.define do
  factory :order_buyer_record do
    postcode { '000-0000' }
    prefecture_id { 2 }
    city { "００市" }
    block { "10" }
    building { "００アパート" }
    phone_number { "09000000000" }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
