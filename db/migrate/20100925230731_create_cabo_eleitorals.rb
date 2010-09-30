class CreateCaboEleitorals < ActiveRecord::Migration
  def self.up
    create_table :cabo_eleitorals do |t|
      t.string :tipo_ajuda
      t.float :valor_ajuda
      t.references :pessoa

      t.timestamps
    end
  end

  def self.down
    drop_table :cabo_eleitorals
  end
end
