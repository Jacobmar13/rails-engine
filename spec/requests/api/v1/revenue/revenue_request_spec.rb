require 'rails_helper'

RSpec.describe 'Revenue API' do
  describe 'merchants revenue request' do
    it 'returns top ten merchants by revenue' do
      invoice_items = create_list(:invoice_item, 20)

      invoice_items.each do |invoice_item|
        create(:transaction, invoice: invoice_item.invoice)
      end

      get '/api/v1/revenue/merchants?quantity=10'

      expect(response).to be_successful

      merchants_returned = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants_returned.count).to eq(10)
    end
    it 'gives an error when there is no quantity' do
      invoice_items = create_list(:invoice_item, 20)

      invoice_items.each do |invoice_item|
        create(:transaction, invoice: invoice_item.invoice)
      end

      get '/api/v1/revenue/merchants'
      # require 'pry';binding.pry
      expect(response).to be_a_bad_request
    end
  end
  describe 'merchant revenue request' do
    it 'returns a single merchants revenue' do
      invoice_item = create(:invoice_item)
      transaction = create(:transaction, invoice: invoice_item.invoice)
      merchant = Merchant.last

      get "/api/v1/revenue/merchants/#{merchant.id}"

      expect(response).to be_successful

      merchant_revenue = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchant_revenue).to have_key(:id)
      expect(merchant_revenue[:id]).to be_an(String)

      expect(merchant_revenue).to have_key(:type)
      expect(merchant_revenue[:type]).to be_a(String)

      expect(merchant_revenue[:attributes]).to have_key(:revenue)
      expect(merchant_revenue[:attributes][:revenue]).to be_a(Float)
    end
  end
end
