class Api::V1::Revenue::MerchantsController < ApplicationController
  def top_earners
    if params[:quantity]
      merchants = Merchant.top_merchants(params[:quantity])
      render json: MerchantRevenueSerializer.new(merchants)
    else
      render json: ErrorSerializer.error, status: :bad_request
    end
  end
end
