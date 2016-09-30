class CreateDohmhInspections < ActiveRecord::Migration
  def change
    create_table :dohmh_inspections do |t|
      t.integer  "camis",                 null: false
      t.string   "dba",                   limit: 255
      t.string   "address",               limit: 255
      t.string   "boro",                  limit: 255
      t.string   "building"
      t.string   "street",                limit: 255
      t.integer  "zipcode",               null: false
      t.string   "phone",                 limit: 255
      t.string   "action",                limit: 255
      t.string   "violation_code",        limit: 255
      t.text      "violation_description"
      t.string   "critical_flag",         limit: 255
      t.string   "cuisine_description",   limit: 255
      t.date     "inspection_date",       null: false
      t.integer  "score"
      t.string   "grade",                 limit: 255
      t.date     "grade_date"
      t.string   "inspection_type",       limit: 255
      t.date     "record_date"

      t.timestamps                        null: false, default: Time.now
    end

  end
end
