class Doacao < ActiveRecord::Base
  belongs_to :pessoa #nome do model
  
  accepts_nested_attributes_for :pessoa
    
  validates :valor_doaco,   :presence => true, :numericality => true
  validates :data_doacao,   :presence => true
end
