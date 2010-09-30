class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :email
      t.string :senha
      t.references :tipo_usuario
      t.references :pessoa

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
