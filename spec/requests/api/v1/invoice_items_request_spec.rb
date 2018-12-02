require 'rails_helper'

describe "Invoice Item API" do
  it "sends a list of invoice items" do
    create_list(:invoice_items, 5)

    get "/api/v1/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"].count).to eq(5)
  end

  it "can get one invoice item request by its id " do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"]["id"]).to eq(id.to_s)
  end
end
