class FileProcessor
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def process()
        file = File.read(file_path)
        csv = CSV.parse(file, headers: true)

        csv.each do |row|
            expense = row.to_h
            CategoryFile.new(expense["category"]).add_expense(row)
        end
    end
end