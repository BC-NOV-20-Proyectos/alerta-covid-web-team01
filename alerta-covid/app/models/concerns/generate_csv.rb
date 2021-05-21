# models/concerns/generate_csv.rb
module GenerateCSV
    extend ActiveSupport::Concern
  
    class_methods do
      def generate_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |article|
              csv << article.attributes.values_at(*column_names)
            end
          end
      end
    end
end