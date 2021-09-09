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
    end
  end
end
