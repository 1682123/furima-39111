class BuyerRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  
  def index
    @order_buyer_record = OrderBuyerRecord.new
  end

  def create
    @order_buyer_record = OrderBuyerRecord.new(buyer_record_params)
    if @order_buyer_record.valid?
      pay_item
      @order_buyer_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_record_params
    params.require(:order_buyer_record).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in? && @item.buyer_records.blank?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
