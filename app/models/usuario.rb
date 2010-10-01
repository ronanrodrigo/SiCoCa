class Usuario < ActiveRecord::Base
  belongs_to :tipo_usuario
  belongs_to :pessoa
  
  accepts_nested_attributes_for :tipo_usuario
  
  validates :email, :presence => true, uniqueness => true
  validates :senha, :presence => true
end
