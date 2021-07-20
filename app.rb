require 'csv'
require_relative './lib/category_file'
require_relative './lib/file_processor'

puts 'Processando arquivos CSV'

FileProcessor.new('./data/nubank-2021-05.csv').process()
FileProcessor.new('./data/nubank-2021-06.csv').process()
FileProcessor.new('./data/nubank-2021-07.csv').process()