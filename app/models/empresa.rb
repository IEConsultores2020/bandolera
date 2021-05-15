class Empresa < ActiveRecord::Base
	belongs_to :user
	has_many :inscritos

  def user_name
     user.try(:name)
  end 



end
