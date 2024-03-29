class Location < ActiveRecord::Base
  belongs_to :wish
  geocoded_by :address
  validates :address, presence: true
  after_validation :geocode, if: ->(obj){ obj.address.present? and
                                               obj.address_changed? and
                                               obj.latitude.nil? }
end
