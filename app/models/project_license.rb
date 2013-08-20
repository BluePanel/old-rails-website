class ProjectLicense < ActiveRecord::Base
  has_and_belongs_to_many :projects

  attr_accessible :name, :license_url, :license_text
  
  validates :name, presence: true, uniqueness: true
  validates :license_text, presence: { if: "license_url.blank?" }
end
