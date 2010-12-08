class AddColumnsToPlacaCasas < ActiveRecord::Migration
  def self.up #para fazer a parada
    add_column :placa_casas, :cep, :string
  end

  def self.down #para desfazer a cagada
    remove_column :placa_casas, :cep
  end
end