class CreateCarroSoms < ActiveRecord::Migration
  def self.up
    create_table :carro_soms do |t|
      t.string :placa_carro
      t.string :modelo_carro
      t.references :pessoa

      t.timestamps
    end
  end

  def self.down
    drop_table :carro_soms
  end
end
