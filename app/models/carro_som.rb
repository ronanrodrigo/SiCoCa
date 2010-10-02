class CarroSom < ActiveRecord::Base
  belongs_to :pessoa
  
  accepts_nested_attributes_for :pessoa
  
  validates :placa_carro,  :presence => true
  validates :modelo_carro, :presence => true
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :pessoa ], 
            :conditions => ['pessoas.nome LIKE ? or placa_carro LIKE ? or modelo_carro LIKE ?',
                            "%#{search}%",       "%#{search}%",        "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
