namespace :restaurants  do
  desc "pull dohmh_inspections data into restaurants"
  task :extract => :environment do
    Geocoder.configure(:lookup => :google, :google => {:api_key => ENV['google_api_key']})
    Inspection.group(:camis).where.not(:grade => "NULL").where(:cuisine_description => "Thai").order(inspection_date: :desc).each do |inspection|
      inspection.grade_date ||= "1900/01/01"

      Restaurant.where(name: inspection.dba).first_or_initialize.tap do |restaurant|
        if (!restaurant.lat)
          results = Geocoder.search(inspection.address)
          restaurant.lat = results.first.latitude
          restaurant.lng = results.first.longitude
        end
        restaurant.address = inspection.address,
        restaurant.grade = inspection.grade,
        restaurant.grade_date = inspection.grade_date,
        restaurant.cuisine = inspection.cuisine_description
        restaurant.save
      end

    end

  end

end
