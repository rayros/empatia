class Post < ActiveRecord::Base
  # For Paperclip pictures
  has_attached_file :picture,
    :styles => { :default => "610x>", :thumb => "100x100>" },
    :url => "/:class/:id/:style/:basename.:extension",
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/,
    :size => { :in => 0..2000.kilobytes }
  # For friendly
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
