class CreateCavaletes < ActiveRecord::Migration
  def self.up
    create_table :cavaletes do |t|
      t.boolean :irregular
      t.references :placa

      t.timestamps
    end
  end

  def self.down
    drop_table :cavaletes
  end
end
