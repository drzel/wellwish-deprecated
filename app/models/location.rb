class Location < ActiveRecord::Base
  belongs_to :wish
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and
                                               obj.address_changed? and
                                               obj.latitude.nil? }
end
