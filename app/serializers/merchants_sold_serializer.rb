class MerchantsSoldSerializer
  include FastJsonapi::ObjectSerializer
  set_type :merchant_name_revenue
  attributes :name, :sold
end
