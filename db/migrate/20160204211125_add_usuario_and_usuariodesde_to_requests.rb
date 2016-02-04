class AddUsuarioAndUsuariodesdeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :usuario, :string
    add_column :requests, :usuariodesde, :date
  end
end
