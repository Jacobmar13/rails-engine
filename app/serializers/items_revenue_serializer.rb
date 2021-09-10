class ItemsRevenueSerializer
  include FastJsonapi::ObjectSerializer
  set_type :item_revenue
  attributes :name, :description, :unit_price, :merchant_id, :revenue
end
