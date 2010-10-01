class Cavalete < ActiveRecord::Base
  belongs_to :placa
  
  accepts_nested_attributes_for :placa
end
