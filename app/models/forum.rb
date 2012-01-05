class Forum < ActiveRecord::Base
  has_many :topics
  accepts_nested_attributes_for :topics

  validates_presence_of :name
  validates_presence_of :description

end
