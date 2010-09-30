class AdicionarcampoPessoaPlacaCasa < ActiveRecord::Migration
  def self.up #para fazer a parada
    add_column :placa_casas, :pessoa_id, :integer
  end

  def self.down #para desfazer a cagada
    remove_column :placa_casas, :pessoa_id
  end
end
