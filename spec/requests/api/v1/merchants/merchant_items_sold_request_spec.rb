require 'rails_helper'

describe "Merchant by Items Sold API" do
  describe 'basic api call' do
    it "give list of merchants ordered by items sold with quantity param" do
      merchant1 = Merchant.create(name: 'Target')
      merchant2 = Merchant.create(name: 'Walmart')
      merchant3 = Merchant.create(name: 'HEB')

      

      get "/api/v1/merchants/most_items?quantity=3"

      expect(response).to be_successful

      merchants_returned = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants_returned.first[:attributes][:merchant_id]).to eq(merchant4.id)
    end
  end
end
