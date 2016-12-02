json.array!(@village_maps) do |village_map|
  json.extract! village_map, :id, :title, :village_name, :project_id
  json.url village_map_url(village_map, format: :json)
end
