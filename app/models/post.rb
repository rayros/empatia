# == Schema Information
#
# Table name: posts
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  description          :text
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  slug                 :string(255)
#  user_id              :integer
#  accepted             :boolean          default(FALSE), not null
#
# Indexes
#
#  index_posts_on_slug     (slug) UNIQUE
#  index_posts_on_user_id  (user_id)
#

class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  #validates :accepted, presence: true
  # For Paperclip pictures
  has_attached_file :picture,
    :styles => { :default => "610x>", :thumb => "100x100>" },
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment :picture,
    :presence => true,
    :size => { :in => 0..2000.kilobytes }

  # For friendly
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  # Methods
  def accepted!
    update_attribute(:accepted, true)
  end

  def not_accepted!
    update_attribute(:accepted, false)
  end
end
