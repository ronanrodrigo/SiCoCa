class Usuario < ActiveRecord::Base
  belongs_to :tipo_usuario
  belongs_to :pessoa
  
  accepts_nested_attributes_for :tipo_usuario
  
  validates :email, :presence => true
  validates :senha, :presence => true
  
  def self.search(search)
    if search
      find( :all, 
            :include => [ :pessoa ], 
            :conditions => ['pessoas.nome LIKE ? or email LIKE ?',
                            "%#{search}%",          "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
