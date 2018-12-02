FactoryBot.define do
  factory :transaction do
    credit_card_number { "MyString" }
    credit_card_expiration_date { "2018-12-02 15:29:32" }
    result { "MyString" }
    invoice { "" }
  end
end
