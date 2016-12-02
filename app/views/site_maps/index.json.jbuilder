json.array!(@site_maps) do |site_map|
  json.extract! site_map, :id, :title, :description, :from_km, :to_km
  json.url site_map_url(site_map, format: :json)
end
