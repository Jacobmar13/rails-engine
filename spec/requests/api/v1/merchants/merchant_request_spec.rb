require 'rails_helper'

describe "Merchant API" do
  describe 'basic api call' do
    it "sends merchant specified" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
