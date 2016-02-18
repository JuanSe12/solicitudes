json.array!(@paramclavs) do |paramclav|
  json.extract! paramclav, :id, :tipoclave, :maxlongitud, :minlongitud, :maxcaracteres, :mincaracteres, :maxalfanumerico, :minalfanumerico, :maxnumerico, :minnumerico, :maxcapital, :mincapital, :numeroreintentos, :diascambios
  json.url paramclav_url(paramclav, format: :json)
end
