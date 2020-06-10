class Stock < ApplicationRecord
  validates_with StockValidator
  has_many :datapoints
end

class StockValidator < ActiveModel::Validator
  validates :symbol, uniqueness: true, length: { minimum: 3, maximum: 4 }
end