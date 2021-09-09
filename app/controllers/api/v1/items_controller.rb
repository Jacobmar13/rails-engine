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
    
  end
end
