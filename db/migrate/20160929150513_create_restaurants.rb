class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
        t.string    :name,              null: false, unique: true
        t.string    :address,           null: false
        t.float     :lat,               null: false
        t.float     :lng,               null: false
        t.string    :grade,             null: false, default: "Unknown"
        t.date      :grade_date,        null: false
        t.string    :cuisine,           null: false

        t.timestamps                    null: false
    end
  end
end
