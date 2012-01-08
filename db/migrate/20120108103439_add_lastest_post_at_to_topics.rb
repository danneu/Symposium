class AddLastestPostAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :latest_post_at, :datetime
  end
end
