require 'rails_helper'

RSpec.describe 'Revenue API' do
  describe 'merchants request' do
    it 'returns top ten merchants by revenue' do
      merchants = create_list(:merchant, 20)

      get '/api/v1/revenue/merchants'

      expect(response).to be_successful

      merchants_returned = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants_returned.count).to eq(10)
    end
  end
end
