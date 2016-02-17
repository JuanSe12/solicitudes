json.array!(@parametroclaves) do |parametroclafe|
  json.extract! parametroclafe, :id, :tipoclave, :maxlongitud, :minlongitud, :maxcaracteres, :mincaracteres, :maxalfanumerico, :minalfanumerico, :maxnumerico, :minnumerico, :maxcapital, :mincapital, :numeroreintentos, :diascambios
  json.url parametroclafe_url(parametroclafe, format: :json)
end
