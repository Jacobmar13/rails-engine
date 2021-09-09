require 'rails_helper'

describe "Item Merchant API" do
  describe 'basic api call' do
    it "list the merchant for an item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}/merchant"

      expect(response).to be_successful

      item_merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(item_merchant).to have_key(:id)
      expect(item_merchant[:id]).to be_an(String)

      expect(item_merchant).to have_key(:type)
      expect(item_merchant[:type]).to be_a(String)

      expect(item_merchant[:attributes]).to have_key(:name)
      expect(item_merchant[:attributes][:name]).to be_a(String)
    end
  end
end
