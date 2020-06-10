class StockValidator < ActiveModel::Validator
  puts 'Entering StockValidator'
  def validate(record)
    if Stock.find_by(symbol: record.symbol).nil?
      puts 'Stock added: ' + record.symbol.to_s
    else
      record.errors.add :base, 'Pre-existing Symbol Error for ' + record.symbol.to_s
      puts record.errors.full_messages
    end
  end
end

class Stock < ApplicationRecord
  # validates :symbol, uniqueness: true, length: { minimum: 3, maximum: 4 }
  validates_with StockValidator
  has_many :datapoints
end
