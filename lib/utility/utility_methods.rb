# frozen_string_literal: true

# Utility Methods
# Author:       ND Guthrie
# Date:         20190830
#

def find_file_names(directory)
    file_names = Array[]
    temp = Dir.entries(directory)
    temp.each do |symbol|
      if (symbol != '.') && (symbol != '..')
        file_names.push(symbol)
      end
    end
    file_names
  end
  
  def find_symbol_names(directory)
    symbol_names = Array []
    file_names = find_file_names(directory)
    file_names.each do |symbol|
      symbol_names.push(symbol.split('.', 3)[0])
    end
    symbol_names
  end
  
  def read_file(file_name)
    file_stream = File.open(file_name, 'r')
    file_data = file_stream.readlines
    file_stream.close
    file_data
  end
  
  def check_for_duplicate_stocks(directory)
    symbol_names = find_symbol_names(directory)
    sql_string = 'SELECT symbol FROM stocks'
    new_stocks = get_results(sql_string, symbol_names)
  
    sql_string = 'SELECT symbol FROM etfs'
    new_etfs = get_results(sql_string, symbol_names)
  end
  
  def get_results(sql_string, symbol_names)
    new_symbols = Array[]
    results = ActiveRecord::Base.connection.execute(sql_string)
    results.each do |result|
      symbol_names.each do |symbol|
        if symbol != result
          new_symbols.push(symbol)
        end
      end
    end
    new_symbols
  end
  
  def print_line(line)
    daydate, open, high, low, close, volume, openint = line.split(',', 7)
    puts 'daydate: ' + daydate.to_s
    puts 'open: ' + open.to_s
    puts 'high:' + high.to_s
    puts 'low: ' + low.to_s
    puts 'close:' + close.to_s
    puts 'volume: ' + volume.to_s
    puts 'openint: ' + openint.to_s
    puts
  end
  