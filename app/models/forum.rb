class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description

  delegate :latest_post, to: :latest_topic

  def latest_topic
    self.topics.first
  end

end
