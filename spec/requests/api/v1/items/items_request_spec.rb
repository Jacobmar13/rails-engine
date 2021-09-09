require 'rails_helper'

describe "Items API" do
  describe 'basic api call' do
    it "sends a list of items" do
      create_list(:item, 20)

      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(20)

      items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_an(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to be_a(String)

        items[:attributes].each do |attribute|
          expect(attribute).to have_key(:name)
          expect(attribute).to have_key(:description)
          expect(attribute).to have_key(:unit_price)
          expect(attribute).to have_key(:merchant_id)
        end
      end
    end
  end

  describe 'advanced search params' do
    it 'only returns 20 results a page if not specified' do
      create_list(:item, 25)

      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(20)
    end
    it 'can specify number of results returned on a page' do
      create_list(:item, 25)

      get '/api/v1/items?per_page=25'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(25)
    end
    it 'can specify what page of results to return' do
      create_list(:item, 25)

      get '/api/v1/items?page=2'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(5)
    end
    it 'can search by page and specify results per page at once' do
      create_list(:item, 80)

      get '/api/v1/items?per_page=50&page=2'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(30)
    end
  end
end
