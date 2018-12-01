require 'csv'

namespace :import do

  desc "Import Items from CSV"
  task items: :environment do
    file_path = "./db/data/items.csv"
    CSV.foreach(file_path, headers: true) do |row|
      Item.create!(row.to_h)
  end
end
