class Api::V1::Revenue::MerchantsController < ApplicationController
  def top_earners
    if params[:quantity]
      merchants = Merchant.top_merchants(params[:quantity])
      render json: MerchantRevenueSerializer.new(merchants)
    else
      error = 'Error, quantity param is missing'
      render json: ErrorSerializer.error(error), status: :bad_request
    end
  end

  def show
    
  end
end
