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
    if params[:quantity]
      merchants = Merchant.top_sold(params[:quantity])
      render json: MerchantsSoldSerializer.new(merchants)
    else
      error = 'Quantity param needs to be passed'
      render json: ErrorSerializer.error(error), status: :bad_request
    end
  end
end
