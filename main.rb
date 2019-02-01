require_relative './lib/csv_sorter'

filename = ARGV[0]
raise ArgumentError, "Invalid file" if filename.nil? || !filename.include?('csv')

sorter = CsvSorter.new(filename)
sorter.process!
