class ImportRestaurants < ActiveRecord::Migration
  def change
    Rake::Task['restaurants:extract'].invoke
  end
end
