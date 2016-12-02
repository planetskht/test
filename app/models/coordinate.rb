require 'roo'
class Coordinate < ActiveRecord::Base
  belongs_to :sub_project, foreign_key: :sub_project_id

  def satelite_view_url
    "https://www.google.com/maps/search/#{self.lattitude},#{self.longitude}/data=!3m1!1e3"
    # "http://maps.google.com/?q=#{self.lattitude},#{self.longitude}"
  end

  def self.import(file, sub_project)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (4..spreadsheet.last_row).each do |i|
      puts spreadsheet.row(i)
      row = spreadsheet.row(i)
      if row[0] != nil && row[1] != nil && row[2] != nil && row[3] != nil && row[4] != nil
        coordinate = new(sub_project: sub_project)
        coordinate.title = row[0]
        coordinate.east_utm = row[1]
        coordinate.north_utm = row[2]
        coordinate.lattitude = row[3]
        coordinate.longitude = row[4]
        coordinate.description = row[5]
        coordinate.save!
      end
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end  


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
