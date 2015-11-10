class Tool < ActiveRecord::Base
  has_and_belongs_to_many :wishes
  has_and_belongs_to_many :users
end
