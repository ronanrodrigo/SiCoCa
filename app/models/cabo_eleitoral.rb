class CaboEleitoral < ActiveRecord::Base
  belongs_to :pessoa

  accepts_nested_attributes_for :pessoa
  
  validates :tipo_ajuda,  :presence => true
  validates :valor_ajuda, :presence => true, :numericality => true
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :pessoa ], 
            :conditions => ['pessoas.nome LIKE ? or tipo_ajuda LIKE ? or valor_ajuda LIKE ?',
                            "%#{search}%",       "%#{search}%",        "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
