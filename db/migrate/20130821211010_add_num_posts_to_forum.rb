class AddNumPostsToForum < ActiveRecord::Migration
  def change
    add_column :forums, :num_posts, :integer
  end
end
