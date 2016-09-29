require_relative '../../app/services/extractor'

namespace :etl  do
  desc "extract data from dohmh"
  task :extract do
    # Rake.application.rake_require "#{Rails.root}/app/services/Loader.rb"
    extractor = Extractor.new()
    extractor.extract_transform_and_load
  end
end
