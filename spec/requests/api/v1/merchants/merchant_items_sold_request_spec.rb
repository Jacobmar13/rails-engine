require 'rails_helper'

describe "Merchant by Items Sold API" do
  describe 'basic api call' do
    it "give list of merchants ordered by items sold with quantity param" do
      create_list(:merchant, 20)
      merchant1 = Merchant.first
      merchant2 = Merchant.second
      merchant3 = Merchant.third
      merchant4 = Merchant.fourth
      merchant5 = Merchant.fifth

      create_list(:item, 8, merchant_id: merchant4.id)
      create_list(:item, 6, merchant_id: merchant2.id)
      create_list(:item, 5, merchant_id: merchant5.id)
      create_list(:item, 3, merchant_id: merchant1.id)
      create_list(:item, 2, merchant_id: merchant3.id)

      get "/api/v1/merchants/most_items?quantity=6"

      expect(response).to be_successful

      merchants_returned = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants_returned.first[:attributes][:merchant_id]).to eq(merchant4.id)
    end
  end
end
