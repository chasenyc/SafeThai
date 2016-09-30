require 'open-uri'
require 'csv'

namespace :etl  do
  desc "extract data from dohmh"
  task :extract => :environment do
    extractor = Extractor.new()
    extractor.extract_transform_and_load
  end
end


class Extractor

  def initialize(url = "https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.csv?accessType=DOWNLOAD")
    @url = url
    @results = []
  end

  def extract_transform_and_load
    extract
    transform
    load_into_db
  end

  def extract
    File.open(Rails.root.join('tmp', 'temp.csv'), "wb") do |saved_file|
      puts 'downloading, please be patient as this may take a few minutes...'
      open(@url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
      puts 'download complete!'
    end
  end

  def transform
    puts "scanning records and inserting data into db"
    CSV.foreach(Rails.root.join('tmp', 'temp.csv'), :headers => true, :header_converters => lambda { |h| h.downcase.gsub(' ', '_') }) do |csv_obj|
      @results << transform_data(csv_obj.to_h)
      load_into_db if @results.length > 2000
    end
    puts "completed extracting #{@results.length} records."
  end

  def load_into_db
    loader = Loader.new(@results)
    loader.update_database
    @results = []
  end

  def transform_data(row)
    sanitize_input(row)
    add_full_address(row)

    return row
  end

  def sanitize_input(row)
    row['inspection_date'] = row['inspection_date'] ? Date.strptime(row['inspection_date'], '%m/%d/%Y').to_s : row['inspection_date']
    row['grade_date'] = row['grade_date'] ? Date.strptime(row['grade_date'], '%m/%d/%Y').to_s : row['grade_date']
    row['record_date'] = row['record_date'] ? Date.strptime(row['record_date'], '%m/%d/%Y').to_s : row['record_date']
    row.each { |k,v| row[k] =  v ? v.gsub("'", "''") : "NULL" }
  end

  def add_full_address(row)
    row['address'] = "#{row['building']} #{row['street']} #{row['boro']}, NY #{row['zipcode']}"
  end

end

class Loader
  def initialize(data = [])
    @data = data.uniq { |v| "#{v['camis']}#{v['inspection_date']}#{v['violation_code']}" }
  end

  def update_database
    print '.'
    record_values.each_slice(500) do |chunk|
      sql = "INSERT INTO dohmh_inspections
      #{keys_for_rows}
      VALUES #{chunk.join(', ').gsub("'NULL'", "NULL")};"
      ActiveRecord::Base.connection.execute(sql)
    end
  end

  def keys_for_rows
    "(#{@data.first.keys.join(', ')})"
  end

  def record_values
    values = []
    @data.each do |row|
      values << "(#{row.values.map{|v| "'#{v}'" }.join(', ')})"
    end
    values
  end

end
