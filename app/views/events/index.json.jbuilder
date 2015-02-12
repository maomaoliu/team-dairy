json.array!(@events) do |event|
  json.extract! event, :id, :message, :image
  json.url event_url(event, format: :json)
end
