class Placa < ActiveRecord::Base
  has_many :placa_casas
  has_many :cavaletes
end
