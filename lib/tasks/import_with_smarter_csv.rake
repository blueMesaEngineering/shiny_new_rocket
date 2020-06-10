# frozen_string_literal: true

require "#{Rails.root}/lib/utility/utility_methods"
require 'smarter_csv'

namespace :import_with_smarter_csv do
  desc 'Import symbol names from files using smarter_csv gem.'
  task stocks: :environment do
    time_start = Time.new
    puts 'Import Start Time: ' + time_start.inspect
    directory = "#{Rails.root}/resources/stocks"
    file_names = find_file_names(directory)
    file_names.each do |file_name|
      stock_parameters = { symbol: file_name.split('.', 3)[0], name: '' }
      new_stock = Stock.create!(stock_parameters)
      stock_id_hash = Hash['stock_id' => new_stock.id, 'symbol' => new_stock.symbol]
      file_data = SmarterCSV.process(directory + '/' + file_name)
      file_data.each do |index|
        # datapoint_hash = index
        # datapoint_parameters = stock_id_hash.merge(datapoint_hash)
        # datapoint = Datapoint.create!(datapoint_parameters)
        datapoint = Datapoint.create!(stock_id_hash.merge(index))
        datapoint.save!
      end
    end
    time_end = Time.new
    puts 'Import End Time: ' + time_end.inspect
  end
end
