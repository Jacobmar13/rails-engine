class Api::V1::MerchantsController < ApplicationController

  def index
    params[:page] = 1 if params[:page] && params[:page] <= '0'
    merchants = Merchant.all.paginate(page: params[:page], per_page: params[:per_page])
    render json: MerchantSerializer.format_merchants(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.format_merchant(merchant)
  end

end
