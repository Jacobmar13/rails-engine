require 'rails_helper'

describe "Merchant Find API" do
  describe 'search param' do
    it "finds a merchant with name" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?name=#{merchant.name}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to be_a(String)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
    it "finds a merchant with partial name" do
      merchant = Merchant.create!(name: 'Target')

      get "/api/v1/merchants/find?name=ar"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to be_a(String)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
    it "returns a nil object response if merchant does not exist" do
      merchant = Merchant.create!(name: 'Target')

      get "/api/v1/merchants/find?name=none"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant).to have_key(:data)
      expect(merchant[:data]).to be_an(Hash)

      expect(merchant[:data]).to have_key(:id)
      expect(merchant[:data][:id]).to be_a(String)

      expect(merchant[:data]).to have_key(:attributes)
      expect(merchant[:data][:attributes].empty?).to eq(true)
    end
  end
end
