class CreatePlacaCasas < ActiveRecord::Migration
  def self.up
    create_table :placa_casas do |t|
      t.boolean :autoriza
      t.references :placa

      t.timestamps
    end
  end

  def self.down
    drop_table :placa_casas
  end
end
