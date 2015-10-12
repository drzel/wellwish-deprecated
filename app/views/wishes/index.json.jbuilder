json.array!(@wishes) do |wish|
  json.extract! wish, :id, :title, :description
  json.url wish_url(wish, format: :json)
end
