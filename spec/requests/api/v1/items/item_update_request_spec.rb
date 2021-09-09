require 'rails_helper'

RSpec.describe 'Item Update Api' do
  describe 'patch request' do
    it 'can update an item' do
      id = create(:item).id
      previous_name = Item.last.name
      item_params = { name: 'Sleepytime Tea' }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
      item = Item.find_by(id: id)

      expect(response).to be_successful
      expect(item.name).to_not eq(previous_name)
      expect(item.name).to eq('Sleepytime Tea')
    end
    it 'returns an error page with bad merchant id' do
      id = create(:item).id
      item_params = { merchant_id: -1 }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})

      expect(response).to be_a_bad_request
    end
  end
end
