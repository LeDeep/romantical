class Picture < ActiveRecord::Base

  attr_accessible :picture, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :user_id
  
  #validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/png" ]
                       #:size => { :in => 0..10.kilobytes }
  belongs_to :user
  belongs_to :profile

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png"
end
                    #:path => ":rails:root/tmp/images/:id/:style/basename.:extension"


