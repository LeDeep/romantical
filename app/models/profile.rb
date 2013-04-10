class Profile < ActiveRecord::Base

  validates :name, :gender, :birthdate, :city, :state, :user_id, :presence => true
  attr_accessible :name, :gender, :birthdate, :city, :state, :user_id
  

  belongs_to :user
end
