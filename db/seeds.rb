# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Registro.create(:email => "juan147123@gmail.com")
Paramclav.create(:tipoclave => "1", :maxlongitud => "2", :minlongitud => "2", :maxcaracteres => "2", :mincaracteres => "2", :maxalfanumerico => "2", :minalfanumerico => "2", :maxnumerico => "2", :minnumerico => "2", :maxcapital => "2", :mincapital => "2", :numeroreintentos => "3", :diascambios => "3")
Paramclav.create(:tipoclave => "2", :maxlongitud => "2", :minlongitud => "2", :maxcaracteres => "2", :mincaracteres => "2", :maxalfanumerico => "2", :minalfanumerico => "2", :maxnumerico => "2", :minnumerico => "2", :maxcapital => "2", :mincapital => "2", :numeroreintentos => "3", :diascambios => "3")