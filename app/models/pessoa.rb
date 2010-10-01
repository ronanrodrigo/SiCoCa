class Pessoa < ActiveRecord::Base
  has_many :placa_casas,    :dependent => :destroy
  has_many :carro_soms,     :dependent => :destroy
  has_many :doacaos,        :dependent => :destroy
  has_one  :cabo_eleitoral, :dependent => :destroy
  has_one  :usuario,        :dependent => :destroy
  validates :nome,  :presence => true
  validates :cpf,   :presence => true
end
