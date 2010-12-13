class AddColumnsToPlaca < ActiveRecord::Migration
  def self.up #para fazer a parada
    add_column :placas, :latitude, :float
    add_column :placas, :longitude, :float
  end

  def self.down #para desfazer a cagada
    remove_column :placas, :latitude
    remove_column :placas, :longitude
  end
end