class Skill < ActiveRecord::Base
  belongs_to :wish
  belongs_to :user
end
