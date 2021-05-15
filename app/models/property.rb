class Property < ActiveRecord::Base  
  belongs_to :home_owner_administrator
  has_many :appliances, dependent: :destroy
  has_many :repairs, dependent: :destroy
  has_many :tenants, dependent: :destroy
  accepts_nested_attributes_for :appliances
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  mount_uploader :owner_ship_certificate, OwnerShipCertificateUploader # Tells rails to use this uploader for this model.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true,
                    uniqueness: { case_sensitive: false }
  
  def hoa_name
    home_owner_administrator.try(:name)
  end 

  def hoa_name=(name)
  	self.home_owner_administrator = home_owner_administrator.find_or_create_by_home_owner_administrator(home_owner_administrator) if home_owner_administrator.present?
  end

  
  
end
