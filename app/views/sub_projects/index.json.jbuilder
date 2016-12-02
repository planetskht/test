json.array!(@sub_projects) do |sub_project|
  json.extract! sub_project, :id, :name, :description, :reference
  json.url sub_project_url(sub_project, format: :json)
end
