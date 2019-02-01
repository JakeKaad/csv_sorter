require 'csv'

class CsvSorter
  attr_reader :filename, :sorted_row

  def initialize(filename)
    @filename = filename
    validate_file!
  end

  def process!
    CSV.foreach(filename) do |row|
      @sorted_row = row.compact.sort
    end
    CSV.open("./output.csv", "wb") do |csv|
      csv << @sorted_row
    end
  end

  private

  def validate_file!
    line_count = %x{wc -l #{filename}}.split.first.to_i
    raise ArgumentError, "Input file must be one line" if line_count != 1
  end
end
