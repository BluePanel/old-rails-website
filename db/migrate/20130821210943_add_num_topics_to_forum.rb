class AddNumTopicsToForum < ActiveRecord::Migration
  def change
    add_column :forums, :num_topics, :integer
  end
end
