require 'rails_helper'

describe "Merchant by Items Sold API" do
  describe 'basic api call' do
    it "give list of merchants ordered by items sold with quantity param" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      item1 = create(:item, merchant_id: merchant2.id)
      item2 = create(:item, merchant_id: merchant2.id)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)
      item5 = create(:item, merchant_id: merchant2.id)
      item6 = create(:item, merchant_id: merchant3.id)
      item7 = create(:item, merchant_id: merchant3.id)
      item8 = create(:item, merchant_id: merchant3.id)
      item9 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant2.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant2.id)
      invoice4 = create(:invoice, merchant_id: merchant2.id)
      invoice5 = create(:invoice, merchant_id: merchant2.id)
      invoice6 = create(:invoice, merchant_id: merchant3.id)
      invoice7 = create(:invoice, merchant_id: merchant3.id)
      invoice8 = create(:invoice, merchant_id: merchant3.id)
      invoice9 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id)
      invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id)
      invoice_item3 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id)
      invoice_item4 = create(:invoice_item, item_id: item4.id, invoice_id: invoice4.id)
      invoice_item5 = create(:invoice_item, item_id: item5.id, invoice_id: invoice5.id)
      invoice_item6 = create(:invoice_item, item_id: item6.id, invoice_id: invoice6.id)
      invoice_item7 = create(:invoice_item, item_id: item7.id, invoice_id: invoice7.id)
      invoice_item8 = create(:invoice_item, item_id: item8.id, invoice_id: invoice8.id)
      invoice_item9 = create(:invoice_item, item_id: item9.id, invoice_id: invoice9.id)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      transaction3 = create(:transaction, invoice_id: invoice3.id)
      transaction4 = create(:transaction, invoice_id: invoice4.id)
      transaction5 = create(:transaction, invoice_id: invoice5.id)
      transaction6 = create(:transaction, invoice_id: invoice6.id)
      transaction7 = create(:transaction, invoice_id: invoice7.id)
      transaction8 = create(:transaction, invoice_id: invoice8.id)
      transaction9 = create(:transaction, invoice_id: invoice9.id)

      get "/api/v1/merchants/most_items?quantity=3"

      expect(response).to be_successful

      merchants_returned = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchants_returned.first[:attributes][:name]).to eq(merchant2.name)
    end
  end
end
