class AddColumnsToPlaca < ActiveRecord::Migration
  def self.up #para fazer a parada
    add_column :placas, :cep, :string
  end

  def self.down #para desfazer a cagada
    remove_column :placas, :cep
  end
end