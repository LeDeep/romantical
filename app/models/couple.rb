class Couple < ActiveRecord::Base

  validates :anniversary, :status, :presence => true

  attr_accessible :anniversary, :status

  has_many :profiles
  has_many :assignments

end