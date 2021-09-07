require 'rails_helper'

describe "Merchants API" do
  describe 'basic api call' do
    it "sends a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(3)

      merchants[:data].each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_an(String)

        expect(merchant).to have_key(:type)
        expect(merchant[:type]).to be_a(String)

        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end

  describe 'advanced search params' do
    it 'only returns 20 results a page if not specified' do
      create_list(:merchant, 25)

      get '/api/v1/merchants'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)
    end
    it 'can specify number of results returned on a page' do
      create_list(:merchant, 25)

      get '/api/v1/merchants?per_page=25'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(25)
    end
    it 'can specify what page of results to return' do
      create_list(:merchant, 25)

      get '/api/v1/merchants?page=2'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(5)
    end
    it 'can search by page and specify results per page at once' do
      create_list(:merchant, 80)

      get '/api/v1/merchants?per_page=50&page=2'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(30)
    end
  end
end
