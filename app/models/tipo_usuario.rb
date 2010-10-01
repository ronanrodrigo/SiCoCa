class TipoUsuario < ActiveRecord::Base
  has_many :usuarios
  
  validates :descricao, :presence => true
end
