require 'rails_helper'

RSpec.describe OrderBuyerRecord, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_buyer_record = FactoryBot.build(:order_buyer_record, user_id:@user.id, item_id:@item.id)
  end

  describe "商品の購入" do
    context "商品の購入ができる場合" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_buyer_record).to be_valid
      end
      it "buildingは空でも保存できること" do
        @order_buyer_record.building = ""
        expect(@order_buyer_record).to be_valid
      end
    end

    context "商品の購入ができない場合"do
      it "postcodeが空では保存できないこと" do
        @order_buyer_record.postcode = ""
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Postcode can't be blank"
      end
      it "postcodeが半角文字のハイフンを含まないと保存できないこと" do
        @order_buyer_record.postcode = "1234567"
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Postcode is invalid"
      end
      it "postcodeが3桁ハイフン4桁の半角文字列でなければ保存できないこと" do
        @order_buyer_record.postcode = "12345678"
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Postcode is invalid"
      end
      it "prefecture_idが空では保存できないこと" do
        @order_buyer_record.prefecture_id = ""
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "prefecture_idが初期値では保存できないこと" do
        @order_buyer_record.prefecture_id = 1
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "cityが空では保存できないこと" do
        @order_buyer_record.city = ""
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "City can't be blank"
      end
      it "blockが空では保存できないこと" do
        @order_buyer_record.block = ""
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Block can't be blank"
      end
      it "phone_numberが空では保存できないこと" do
        @order_buyer_record.phone_number = ""
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Phone number can't be blank"
      end
      it "phone_numberは10桁以上の半角数値でなければ保存できないこと" do
        @order_buyer_record.phone_number = "123456789"
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Phone number is invalid"
      end
      it "phone_numberは11桁以内の半角数値でなければ保存できないこと" do
        @order_buyer_record.phone_number = "123456789000"
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Phone number is invalid"
      end
      it "phone_numberに半角数字以外が含まれている場合は保存できないこと" do
        @order_buyer_record.phone_number = "０１２３４５６７８９"
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Phone number is invalid"
      end
      it "tokenが空では登録できないこと" do
        @order_buyer_record.token = nil
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Token can't be blank"
      end
      it "userが紐付いていなければ保存できないこと" do
        @order_buyer_record.user_id = nil
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "User can't be blank"
      end
      it "itemが紐付いていなければ保存できないこと" do
        @order_buyer_record.item_id = nil
        @order_buyer_record.valid?
        expect(@order_buyer_record.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
