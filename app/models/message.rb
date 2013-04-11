class Message < ActiveRecord::Base

  validates :to, :from, :body, :presence => true

  attr_accessible :to, :from, :body

end