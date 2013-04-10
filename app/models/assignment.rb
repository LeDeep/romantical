class Assignment < ActiveRecord::Base
  validates :couple_id, :activity_id, :points, :presence => true
  attr_accessible :couple_id, :activity_id, :points
  belongs_to(:couple)
  belongs_to(:activity)
end