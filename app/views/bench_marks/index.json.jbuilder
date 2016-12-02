json.array!(@bench_marks) do |bench_mark|
  json.extract! bench_mark, :id, :title, :description, :project_id, :type
  json.url bench_mark_url(bench_mark, format: :json)
end
