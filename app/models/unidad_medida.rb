class UnidadMedida < ActiveRecord::Base
	has_many :articulos
	belongs_to :user

  def user_name
     user.try(:name)
  end 

end
