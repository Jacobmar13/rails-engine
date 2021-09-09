class Api::V1::ItemsController < ApplicationController
  before_action :page_redirect, only: :index

  def index
    items = Item.all.paginate(page: params[:page], per_page: params[:per_page])
    render json: ItemSerializer.new(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item), status: :created
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item)
    else
      render json: ErrorSerializer.error(item.errors.full_messages), status: :bad_request
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
