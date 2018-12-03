class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price

  belongs_to :merchant
  has_many :invoice_items

  def self.most_sold(quantity)
    Item.select('items.*, SUM(invoice_items.quantity) AS number_sold')
    .joins(:invoice_items,invoices: [:transactions])
    .where(transactions: {result: 'success'})
    .group('items.id')
    .order('number_sold DESC')
    .limit(quantity)
  end
end
