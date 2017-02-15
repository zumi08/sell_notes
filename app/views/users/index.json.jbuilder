json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :birthday, :adress, :univ, :college
  json.url user_url(user, format: :json)
end
