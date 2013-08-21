class AddStickyToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :sticky, :boolean
  end
end
