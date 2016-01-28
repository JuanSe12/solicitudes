json.array!(@registros) do |registro|
  json.extract! registro, :id, :email
  json.url registro_url(registro, format: :json)
end
