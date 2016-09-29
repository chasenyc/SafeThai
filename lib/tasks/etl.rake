require_relative '../../app/services/extractor'

namespace :etl  do
  desc "extract data from dohmh"
  task :extract do
    extractor = Extractor.new()
    extractor.extract_transform_and_load
  end
end
