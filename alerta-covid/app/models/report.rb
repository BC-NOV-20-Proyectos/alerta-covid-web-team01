class Report < ApplicationRecord

  def self.to_csv
    CSV.generate do |csv_file|
      csv_file << column_names
        all.each do |report|
          csv_file << report.to_csv
        end
      end
    end
end
