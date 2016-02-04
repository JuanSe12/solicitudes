class AddCuentadestinoAndClientedestinoAndEntidaddestinoToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :cuentadestino, :integer
    add_column :requests, :clientedestino, :string
    add_column :requests, :entidaddestino, :string
  end
end
