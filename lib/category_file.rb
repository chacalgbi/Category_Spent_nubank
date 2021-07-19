class CategoryFile
    attr_reader :category_name, :file

    def initialize(category_name)
      @category_name = category_name
      @file = create_file()
    end

    def add_expense(expense)
        file.write expense
        file.close
    end

    private

    def create_file()
        category_file_path = "./categories/#{category_name}.csv"
        category_file = File.open(category_file_path, "a+")
        if File.empty?(category_file)
            category_file.puts 'date, category, title, amount'
        end
        category_file
    end
end