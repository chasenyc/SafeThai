class CreateDohmhInspections < ActiveRecord::Migration
  def change
    create_table :dohmh_inspections do |t|
      t.integer  "camis",                 limit: 10,  null: false
      t.string   "dba",                   limit: 255
      t.string   "address",               limit: 255
      t.string   "boro",                  limit: 255
      t.integer  "building",              limit: 10,  null: false
      t.string   "street",                limit: 255
      t.integer  "zipcode",               limit: 10,  null: false
      t.string   "phone",                 limit: 10
      t.string   "action",                limit: 255
      t.string   "violation_code",        limit: 255
      t.string   "violation_description", limit: 255
      t.string   "critical_flag",         limit: 255
      t.string   "cuisine_description",   limit: 255
      t.date     "inspection_date",                   null: false
      t.integer  "score",                 limit: 10
      t.string   "grade",                 limit: 10
      t.date     "grade_date"
      t.string   "inspection_type",       limit: 255
      t.date     "record_date"

      t.timestamps                        null: false, default: Time.now
    end

    add_index :dohmh_inspections, ["camis", "inspection_date", "violation_code"], name: "primary_dohmh_inspections_1", unique: true

  end
end
