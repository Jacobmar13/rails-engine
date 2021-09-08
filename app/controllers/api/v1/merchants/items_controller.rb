class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    items = Merchant.find(params[:merchant_id]).items.all
    render json: MerchantItemSerializer.format_items(items)
  end
end
