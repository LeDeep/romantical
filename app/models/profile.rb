class Profile < ActiveRecord::Base

  validates :name, :gender, :in_relationship_with, :relationship_status, :anniversary, :age, :city, :state, :user_id, :presence => true
  attr_accessible :name, :points, :gender, :in_relationship_with, :relationship_status, :anniversary, :age, :city, :state, :user_id
  

  belongs_to :user
end
