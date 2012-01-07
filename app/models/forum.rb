class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description

  def latest_topic
    self.topics.first
  end

end
