class Inspection < ActiveRecord::Base
  self.table_name = 'dohmh_inspections'
  self.primary_keys = :camis, :inspection_date, :violation_code
end
