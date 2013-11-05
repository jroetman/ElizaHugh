json.array!(@specials) do |special|
  json.extract! special, :title, :description, :color, :border
  json.url special_url(special, format: :json)
end
