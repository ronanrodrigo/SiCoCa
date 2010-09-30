class CreateTipoUsuarios < ActiveRecord::Migration
  def self.up
    create_table :tipo_usuarios do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_usuarios
  end
end
