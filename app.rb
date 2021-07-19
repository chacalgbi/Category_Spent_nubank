require 'csv'
require_relative './lib/category_file'
require_relative './lib/file_processor'

puts 'Processando arquivos CSV'

FileProcessor.new('./data/nubank-2021-01.csv').process()