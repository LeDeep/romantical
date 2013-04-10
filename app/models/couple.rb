class Couple < ActiveRecord::Base

  validates :anniversary, :relationship_status, :presence => true

  attr_accessible :anniversary, :relationship_status

  has_many :users
  has_many :assignments




end