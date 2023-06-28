class BuyerRecordsController < ApplicationController
  
  def index
  end

  def new
    @order_buyer_record = OrderBuyerRecord.new
  end

  def create
    @order_buyer_record = OrderBuyerRecord.new(buyer_record_params)
    if @order_buyer_record.valid?
      @order_buyer_record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer_record_params
    params.require(:order_buyer_record).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(buyer_record_id: buyer_record.id)
  end
end
