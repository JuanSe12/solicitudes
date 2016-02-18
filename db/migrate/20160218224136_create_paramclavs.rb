class CreateParamclavs < ActiveRecord::Migration
  def change
    create_table :paramclavs do |t|
      t.integer :tipoclave
      t.integer :maxlongitud
      t.integer :minlongitud
      t.integer :maxcaracteres
      t.integer :mincaracteres
      t.integer :maxalfanumerico
      t.integer :minalfanumerico
      t.integer :maxnumerico
      t.integer :minnumerico
      t.integer :maxcapital
      t.integer :mincapital
      t.integer :numeroreintentos
      t.integer :diascambios

      t.timestamps null: false
    end
  end
end
