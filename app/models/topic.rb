class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  default_scope order: 'updated_at DESC'

  validates_presence_of :title
  validates_presence_of :forum_id
  validates_presence_of :user_id

end
