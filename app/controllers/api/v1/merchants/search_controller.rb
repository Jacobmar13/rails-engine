class Api::V1::Merchants::SearchController < ApplicationController
  def find
    merchant = Merchant.find_merchant(params[:name])
    if merchant
      render json: MerchantSerializer.new(merchant)
    else
      render json: ErrorSerializer.error_object
    end
  end

  def top_items_sold
    merchants = Merchant.top_sold(params[:quantity])
    render json: MerchantsSoldSerializer.new(merchants)
  end
end
