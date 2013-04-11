class Assignment < ActiveRecord::Base
  validates :couple_id, :activity, :points, :presence => true
  attr_accessible :couple_id, :activity, :points

  belongs_to(:couple)
  has_many :compensations
end