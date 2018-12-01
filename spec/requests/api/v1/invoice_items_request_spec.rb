require 'rails_helper'

describe "Invoice Item API" do
  it "sends a list of invoice items" do
    create_list(:invoice_items, 5)

    get "/api/v1/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(5)
  end
end
