class Tienda < ActiveRecord::Base
  belongs_to :empresa
  has_many :inventarios
  belongs_to :user

  def user_name
     user.try(:name)
  end 

  def empresa_nombre
    empresa.try(:nombre)
  end 

  def empresa_nombre=(nombre)
  	self.empresa = empresa.find_or_create_by_nombre(nombre) if nombre.present?
  end

end
