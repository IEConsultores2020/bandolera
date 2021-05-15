class Appliance < ActiveRecord::Base
  mount_uploader :invoice, InvoiceUploader
  belongs_to :property
  belongs_to :gadget
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :contact_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
