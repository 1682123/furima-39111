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
      @order_buyer_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_record_params
    params.require(:order_buyer_record).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in? && @item.buyer_records.blank?
      redirect_to root_path
    end
  end

end
