class Api::V1::MerchantsController < ApplicationController
  before_action :page_redirect, only: :index

  def index
    merchants = Merchant.all.paginate(page: params[:page], per_page: params[:per_page])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
  end
end
