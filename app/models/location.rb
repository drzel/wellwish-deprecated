class Location < ActiveRecord::Base
  belongs_to :wish
  geocoded_by :address
  after_validation :geocode, if: ->(location){ location.address.present? and
                                               location.address_changed? and
                                               location.latitude.nil? }
end
