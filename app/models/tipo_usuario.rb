class TipoUsuario < ActiveRecord::Base
  has_many :usuarios
end
