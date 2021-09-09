require 'rails_helper'

RSpec.describe 'Revenue API' do
  describe 'merchants request' do
    it 'returns top ten merchants by revenue' do
      merchants = create_list(:merchant, 20)

      get '/api/v1/revenue/merchants?quantity=10'

      expect(response).to be_successful
    end
  end
end
