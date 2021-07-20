class FileProcessor
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def process()
        file = File.read(file_path) # lê todo o conteudo do arquivo em uma string
        csv = CSV.parse(file, headers: true) # transforma cada linha em hashes

        csv.each do |row|
            expense = row.to_h
            category = fetch_category(expense)
            #puts "#{expense}"
            CategoryFile.new(category).add_expense(row)
        end
    end

    private

    def fetch_category(expense)
        return expense["category"] if expense["category"] # Retorna category caso exista palavra dentro
        expense["amount"].to_f.positive? ? 'juros_multa' : 'pagamentos'
    end
end