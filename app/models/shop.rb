class Shop < ActiveRecord::Base
  has_many :pictures
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  accepts_nested_attributes_for :pictures

  before_save :set_geo_location

  def set_geo_location
    p self.address
    geo_location = Geocoder.search(self.address).first
    self.latitude = geo_location.latitude
    self.longitude = geo_location.longitude
    p self.address
  end
end
