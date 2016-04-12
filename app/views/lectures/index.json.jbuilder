json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :lect_name, :string, :term_id, :string, :chapter, :string, :description, :string
  json.url lecture_url(lecture, format: :json)
end
