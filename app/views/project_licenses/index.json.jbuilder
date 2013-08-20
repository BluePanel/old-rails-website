json.array!(@project_licenses) do |project_license|
  json.extract! project_license, :name, :license_url, :license_text
  json.url project_license_url(project_license, format: :json)
end
