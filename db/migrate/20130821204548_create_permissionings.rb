class CreatePermissionings < ActiveRecord::Migration
  def change
    create_table :permissionings do |t|
      t.integer :forum_id
      t.integer :role_id
      t.boolean :read_forum
      t.boolean :post_replies
      t.boolean :post_topics

      t.timestamps
    end
  end
end
