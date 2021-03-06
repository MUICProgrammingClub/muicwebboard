json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :lecture_id, :content, :rating
  json.url review_url(review, format: :json)
end
