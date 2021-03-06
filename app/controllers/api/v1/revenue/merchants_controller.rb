class Api::V1::Revenue::MerchantsController < ApplicationController
  def top_earners
    if params[:quantity].to_i.positive?
      merchants = Merchant.top_merchants(params[:quantity])
      render json: MerchantsRevenueSerializer.new(merchants)
    else
      error = 'Error, quantity param must be positive integer'
      render json: ErrorSerializer.error(error), status: :bad_request
    end
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantRevenueSerializer.new(merchant)
  end
end
