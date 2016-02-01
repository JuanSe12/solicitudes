class AddObservacionToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :observacion, :text
  end
end
