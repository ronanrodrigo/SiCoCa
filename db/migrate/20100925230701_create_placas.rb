class CreatePlacas < ActiveRecord::Migration
  def self.up
    create_table :placas do |t|
      t.string :endereco
      t.string :cidade
      t.string :tamanho
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :placas
  end
end
