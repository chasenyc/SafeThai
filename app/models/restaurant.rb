class Restaurant < ActiveRecord::Base
  validates :name, :address, :lat, :lng, :grade, :grade_date, presence: true
  validates :name, uniqueness: true

  def self.filtered(bounds, min_grade, max_grade)
    range = (max_grade .. min_grade).to_a
    self.in_bounds(bounds).where("grade IN(?)", range)
  end

  def self.in_bounds(bounds)
    sw = bounds[:southWest]
    ne = bounds[:northEast]

    self.where(lat: sw[:lat]..ne[:lat])
      .where(lng: sw[:lng]..ne[:lng])
  end

end
