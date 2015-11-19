class Wish < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  has_one :location, dependent: :destroy
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :tools
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :tools
  validates :title, :description, presence: true

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
