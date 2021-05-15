class Propiedad < ActiveRecord::Base
  mount_uploader :archivo, ArchivoUploader # Tells rails to use this uploader for this model.
  validates :nombre, presence: true # Make sure the owner's name is present.
  
end
