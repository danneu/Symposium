class Post < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  # Keep an updated `latest_post_at` in parent topic.
  after_create :update_topic_latest_post_at
  after_destroy :recalculate_topic_latest_post_at

  scope :by_created_at, order(:created_at)

  validates_presence_of :body
  validates_presence_of :user_id
  #validates_presence_of :topic_id

  private

  # OPTIMIZE: This is ugly
  def update_topic_latest_post_at
    self.topic.update_attributes(latest_post_at: self.created_at)
  end

  def recalculate_topic_latest_post_at 
    self.topic.update_attributes(latest_post_at: self.topic.latest_post_at)
  end

end


