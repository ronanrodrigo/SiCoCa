class CarroSom < ActiveRecord::Base
  belongs_to :pessoa
  
  accepts_nested_attributes_for :pessoa
  
  validates :placa_carro,  :presence => true
  validates :modelo_carro, :presence => true
end
