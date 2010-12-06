class Doacao < ActiveRecord::Base
  belongs_to :pessoa
  
  accepts_nested_attributes_for :pessoa
    
  validates :valor_doaco,   :presence => true, :numericality => true
  validates :data_doacao,   :presence => true
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :pessoa ], 
            :conditions => ['pessoas.nome LIKE ? or valor_doaco LIKE ? or data_doacao LIKE ?',
                            "%#{search}%",       "%#{search}%",        "%#{search}%"])
    else
      find(:all)
    end
  end  
end
