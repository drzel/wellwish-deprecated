class Wish < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_one :location, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :location

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
