class AddTopicsCountToForums < ActiveRecord::Migration
  def change
    add_column :forums, :topics_count, :integer
  end
end
