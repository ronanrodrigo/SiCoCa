class PlacaCasa < ActiveRecord::Base
  belongs_to :placa
  accepts_nested_attributes_for :placa
  
  belongs_to :pessoa
  accepts_nested_attributes_for :pessoa
end
