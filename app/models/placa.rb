class Placa < ActiveRecord::Base
  has_many :placa_casas
  has_many :cavaletes
  
  after_validation :fetch_coordinates
  
  validates :endereco,  :presence => true
  validates :cidade,    :presence => true
  validates :tamanho,   :presence => true

  geocoded_by :endereco #joga latitude e longitude nos campos
  
#  def location
#    [:endereco, :cidade, "SC", "Brazil"].compact.join(', ')
#  end
end
