class CarroSom < ActiveRecord::Base
  belongs_to :pessoa
  validates :placa_carro,  :presence => true
  validates :modelo_carro, :presence => true
end
