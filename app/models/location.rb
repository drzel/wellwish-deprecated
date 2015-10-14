class Location < ActiveRecord::Base
  belongs_to :wish
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
