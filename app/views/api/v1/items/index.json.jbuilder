json.array!(@items) do |item|
  json.extract! item, :id
  json.extract! item, :title
  json.extract! item, :serial
end
