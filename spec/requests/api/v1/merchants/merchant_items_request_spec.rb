require 'rails_helper'

describe "Merchant Items API" do
  describe 'basic api call' do
    it "sends a list of merchant items" do
      merchant = create(:merchant)

      create_list(:item, 10, merchant_id: merchant.id )

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_successful

      merchant_items = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_items[:data].count).to eq(10)
    end
  end
end
