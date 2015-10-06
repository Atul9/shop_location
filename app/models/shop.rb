class Shop < ActiveRecord::Base
  has_many :pictures
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  validates_presence_of :name, :address, :description
  accepts_nested_attributes_for :pictures

  before_save :set_geo_location

  def set_geo_location
    geo_location = Geocoder.search(self.address).first
    self.latitude = geo_location.latitude
    self.longitude = geo_location.longitude
  end
end
