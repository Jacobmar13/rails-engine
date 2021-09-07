require 'rails_helper'

describe "Merchant API" do
  describe 'basic api call' do
    it "sends merchant specified" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to be_a(String)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end
end
