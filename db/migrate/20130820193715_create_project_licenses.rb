class CreateProjectLicenses < ActiveRecord::Migration
  def change
    create_table :project_licenses do |t|
      t.string :name
      t.string :license_url
      t.text :license_text

      t.timestamps
    end
  end
end
