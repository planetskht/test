json.array!(@structure_drawings) do |structure_drawing|
  json.extract! structure_drawing, :id, :title, :description, :project_id, :type
  json.url structure_drawing_url(structure_drawing, format: :json)
end
