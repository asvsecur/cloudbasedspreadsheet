json.array!(@data) do |datum|
  json.extract! datum, :id, :name
  json.url datum_url(datum, format: :json)
end
