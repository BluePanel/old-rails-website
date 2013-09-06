class AddPositionToForum < ActiveRecord::Migration
  def change
    add_column :forums, :position, :integer
  end
end
