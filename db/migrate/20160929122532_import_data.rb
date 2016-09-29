class ImportData < ActiveRecord::Migration
  def change
    Rake::Task['etl:extract'].invoke
  end
end
