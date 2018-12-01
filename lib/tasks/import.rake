require 'csv'

namespace :import do

  desc "Import Items from CSV"
  task items: :environment do
    CSV.foreach("")
  end
end
