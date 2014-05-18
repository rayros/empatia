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
#  comment_count        :integer
#  like_count           :integer
#  share_count          :integer
#  total_count          :integer
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
  has_attached_file :picture, :styles => { :default => "610x>", :thumb => "100x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment :picture,
    :presence => true,
    :size => { :in => 0..10.megabytes }

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
 
#  comment_count        :integer
#  like_count           :integer
#  share_count          :integer
#  total_count          :integer
  def hotness
    x = 3 if created_at > 24.hours.ago
    x = 2 if created_at.between?(72.hours.ago, 24.hours.ago)
    x = 1 if created_at.between?(7.days.ago, 3.days.ago)
    x = 0 if created_at < 7.days.ago
    x += 1 if comment_count > 3
    x += 1 if like_count > 5
    x += 1 if share_count > 1
    x += 1 if total_count > 10
    x
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
