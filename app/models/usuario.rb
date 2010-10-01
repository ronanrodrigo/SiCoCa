class Usuario < ActiveRecord::Base
  belongs_to :tipo_usuario
  belongs_to :pessoa
  validates :email, :presence => true, uniqueness => true
  validates :senha, :presence => true
end
