class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :wishes
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :tools
  acts_as_voter

  attr_accessor :login

  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

    validate :validate_username

    def validate_username
      if User.where(email: username).exists?
        errors.add(:username, :invalid)
      end
    end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        conditions[:email].downcase! if conditions[:email]
        where(conditions.to_hash).first
      end
    end
end
