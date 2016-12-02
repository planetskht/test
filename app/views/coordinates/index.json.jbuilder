json.array!(@coordinates) do |coordinate|
  json.extract! coordinate, :id, :title, :description, :east_utm, :north_utm, :lattitude, :longitude, :time_zone
  json.url coordinate_url(coordinate, format: :json)
end
