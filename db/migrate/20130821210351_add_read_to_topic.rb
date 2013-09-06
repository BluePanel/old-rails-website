class AddReadToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :read, :boolean
  end
end
