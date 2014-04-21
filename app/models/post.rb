class Post < ActiveRecord::Base
  has_attached_file :picture, :styles => { :width => "x610>", :thumb => "x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
