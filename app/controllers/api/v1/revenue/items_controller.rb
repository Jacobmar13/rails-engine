class Api::V1::Revenue::ItemsController < ApplicationController
  def top_revenue
    integer = params[:quantity].to_i if params[:quantity]
    if integer && integer <= 0
      error = 'Error, quantity param must be positive number'
      render json: ErrorSerializer.error(error), status: :bad_request
    elsif params[:quantity]
      items = Item.top_items(params[:quantity])
      render json: ItemsRevenueSerializer.new(items)
    else
      items = Item.top_items
      render json: ItemsRevenueSerializer.new(items)
    end
  end
end
