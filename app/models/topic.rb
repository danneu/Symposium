class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :forum, counter_cache: true
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  accepts_nested_attributes_for :posts

  scope :by_latest_post, order('latest_post_at DESC')

  validates_presence_of :title
  validates_presence_of :forum_id
  validates_presence_of :user_id

  def to_s
    title
  end
  
  def latest_post
    self.posts.by_created_at.last
  end

end
