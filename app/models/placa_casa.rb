class PlacaCasa < ActiveRecord::Base
  belongs_to :placa
  belongs_to :pessoa
  
  accepts_nested_attributes_for :placa
  accepts_nested_attributes_for :pessoa
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :pessoa, :placa ], 
            :conditions => ['pessoas.nome LIKE ? or placas.endereco LIKE ? or placas.cidade LIKE ? or placas.cep LIKE ?',
                            "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    else
      find(:all,
           :include => [:placa ],
           :order => 'placas.cep ASC')
    end
  end
  
end
