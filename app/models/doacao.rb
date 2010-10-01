class Doacao < ActiveRecord::Base
  belongs_to :pessoa #nome do model
  validates :valor_doaco,   :presence => true, :numericality => true
  validates :data_doacao,   :presence => true
end
