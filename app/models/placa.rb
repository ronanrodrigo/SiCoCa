class Placa < ActiveRecord::Base
  has_many :placa_casas
  has_many :cavaletes
  validates :endereco,  :presence => true
  validates :cidade,    :presence => true
  validates :tamanho,   :presence => true
end
