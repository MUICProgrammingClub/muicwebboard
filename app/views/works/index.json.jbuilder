json.array!(@works) do |work|
  json.extract! work, :id, :category, :type, :content, :user_id
  json.url work_url(work, format: :json)
end
