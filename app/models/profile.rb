class Profile < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :gender, :city, :state, :birthdate, :user_id
  belongs_to :user


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"



  belongs_to :couple
  # belongs_to :partner, :foreign_key => :partner_id, :class_name => 'User', :inverse_of => :partner
  has_many :compensations

  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']


  def partner
    if self.couple then
      Profile.where("id" => self.couple.profiles.where(:profile_id != self.id))
    end
  end


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
