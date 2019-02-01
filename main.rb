require_relative './lib/csv_sorter'

filename = ARGV[0]

sorter = CsvSorter.new(filename)
sorter.process!
