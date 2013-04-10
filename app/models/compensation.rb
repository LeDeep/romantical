class Compensation < ActiveRecord::Base

  validates :user_id, :activity_id, :points, :expiration, :presence => true

  attr_accessible :user_id, :activity_id, :points, :expiration

  belongs_to :activity
  belongs_to :user




end