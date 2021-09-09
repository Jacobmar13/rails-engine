require 'rails_helper'

describe "Items Find All API" do
  describe 'search param' do
    it 'finds item that matches name' do
      item = create(:item)

      get "/api/v1/items/find_all?name=#{item.name}"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)[:data]

      items.each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_an(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to be_a(String)

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes]).to have_key(:merchant_id)
      end
    end
    it 'finds items that matche partial name' do
      merchant = Merchant.create(name: 'Target')
      item1 = Item.create(name: 'Cards against Humanity', description: 'Card game', unit_price: 19.99, merchant_id: merchant.id)
      item2 = Item.create(name: 'Unstable Unicorns Card Game', description: 'Card game', unit_price: 19.99, merchant_id: merchant.id)
      item3 = Item.create(name: 'Exploding Kittens, A Card Game', description: 'Card game', unit_price: 19.99, merchant_id: merchant.id)
      item4 = Item.create(name: 'Cinephile, A Card Game', description: 'Card game', unit_price: 19.99, merchant_id: merchant.id)

      get "/api/v1/items/find_all?name=card"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(items.count).to eq(4)
    end
  end
end
