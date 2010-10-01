class CaboEleitoral < ActiveRecord::Base
  belongs_to :pessoa
  validates :tipo_ajuda,  :presence => true
  validates :valor_ajuda, :presence => true, :numericality => true
end
