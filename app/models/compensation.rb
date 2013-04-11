class Compensation < ActiveRecord::Base

  validates :profile_id, :assignment_id, :points, :date_of_occurrence, :presence => true

  attr_accessible :profile_id, :assignment_id, :points, :date_of_occurrence

  belongs_to :assignment
  belongs_to :profile

end