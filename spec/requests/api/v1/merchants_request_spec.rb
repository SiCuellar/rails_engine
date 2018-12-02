require 'rails_helper'

describe "Merchants API" do

  it "sends a list of merchants" do
    create_list(:merchant, 5)

    get "/api/v1/merchants"
    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants["data"].count).to eq(5)
  end

  it "it can get one merchant by its id " do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id.to_s)
  end
end
