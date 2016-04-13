json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :user_id, :course_id, :instructor_id, :term_id, :lecture_name, :chapter, :description
  json.url lecture_url(lecture, format: :json)
end
