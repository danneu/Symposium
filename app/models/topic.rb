class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :forum
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  accepts_nested_attributes_for :posts

  scope :by_latest_post, joins(:posts).order('posts.created_at DESC').group('topics.id')

  validates_presence_of :title
  validates_presence_of :forum_id
  validates_presence_of :user_id


  def latest_post
    self.posts.last
  end

end
