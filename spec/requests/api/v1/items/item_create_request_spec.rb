require 'rails_helper'

describe "Item Create API" do
  describe 'basic api post' do
    it "can create a new item" do
      merchant = create(:merchant)
      item_params = ({
        name: 'Electric Boogaloo',
        description: 'Something something darkness..',
        unit_price: 24.95,
        merchant_id: "#{merchant.id}"
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
      created_item = Item.last

      expect(response).to be_successful
      expect(created_item.name).to eq(item_params[:name])
      expect(created_item.description).to eq(item_params[:description])
      expect(created_item.unit_price).to eq(item_params[:unit_price])
      expect(created_item.merchant_id).to eq(item_params[:merchant_id])
    end
  end
end
