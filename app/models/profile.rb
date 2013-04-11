class Profile < ActiveRecord::Base

  validates :name, :gender, :birthdate, :city, :state, :user_id, :presence => true
  attr_accessible :name, :gender, :birthdate, :city, :state, :user_id
  

  belongs_to :user



  def points
    Compensation.where("user_id" => self.user_id).sum("points")
  end

  def in_relationship_with
    self.user.try(:partner).try(:name)
  end

  def relationship_status
    self.user.try(:couple).try(:relationship_status)
  end

  def anniversary
    self.user.try(:couple).try(:anniversary)
  end

  def age
    Date.today.year - self.birthdate.try(:year)
  end
end
