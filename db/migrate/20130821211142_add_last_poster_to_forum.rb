class AddLastPosterToForum < ActiveRecord::Migration
  def change
    add_column :forums, :last_poster, :string
  end
end
