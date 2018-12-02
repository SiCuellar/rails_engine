FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    unit_price { 5 }
    merchant { create(:merchant) }

  end
end
