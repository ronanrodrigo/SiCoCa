class Cavalete < ActiveRecord::Base
  belongs_to :placa
  
  accepts_nested_attributes_for :placa
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :placa ], 
            :conditions => ['placas.endereco LIKE ? or placas.cidade  LIKE ?',
                            "%#{search}%",       "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
