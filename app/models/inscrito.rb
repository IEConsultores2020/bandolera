class Inscrito < ActiveRecord::Base
  belongs_to :user
  belongs_to :empresa

  def empresa_nombre
     empresa.try(:nombre)
  end 

  def user_email
     user.try(:email)
  end 


 validates_presence_of :user_id, :empresa_id

end
