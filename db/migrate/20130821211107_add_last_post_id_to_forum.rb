class AddLastPostIdToForum < ActiveRecord::Migration
  def change
    add_column :forums, :last_post_id, :integer
  end
end
