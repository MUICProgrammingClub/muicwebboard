json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :string, :last_name, :string, :student_id, :integer, :phone_num, :string, :password, :string
  json.url user_url(user, format: :json)
end
