class Loader
  def initialize(data = [])
    @data = data.uniq { |v| "#{v['camis']}#{v['inspection_date']}#{v['violation_code']}" }
  end

  def update_database
    puts 'inserting records into database.'
    record_values.each_slice(100) do |chunk|
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
