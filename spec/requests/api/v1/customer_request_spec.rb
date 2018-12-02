require "rails_helper"

describe "Customer API" do

  it "sends a list of customer" do
    create_list(:customers, 4)

    get "/api/v1/customers"
    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers["data"].count).to eq(4)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers"
    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["id"]).to eq(id.to_s)
  end

end
