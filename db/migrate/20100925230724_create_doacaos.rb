class CreateDoacaos < ActiveRecord::Migration
  def self.up
    create_table :doacaos do |t|
      t.float :valor_doaco
      t.date :data_doacao
      t.references :pessoa

      t.timestamps
    end
  end

  def self.down
    drop_table :doacaos
  end
end
