json.array!(@places) do |place|
  json.extract! place, :id, :title, :description, :status
  json.url place_url(place, format: :json)
end
