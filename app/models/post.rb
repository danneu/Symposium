class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates_presence_of :body
  validates_presence_of :user_id
  #validates_presence_of :topic_id

end


