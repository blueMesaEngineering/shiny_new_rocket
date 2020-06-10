require "#{Rails.root}/app/models/stock"

class DatapointValidator < ActiveModel::Validator
  puts 'Entering DatapointValidator'
  def validate(record)
    stocks = Stock.select(:symbol)
    stocks.each do |item|
      if record.symbol === item.symbol
        # puts 'datapoint matched with stock' + record.symbol.to_s 
      end      
    end
  end
end

class Datapoint < ApplicationRecord
  validates_with DatapointValidator
  belongs_to :stock
end
