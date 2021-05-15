class Repair < ActiveRecord::Base
  mount_uploader :purchase_order, PurchaseOrderUploader 
  belongs_to :type_repair
  belongs_to :user
  belongs_to :property
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

end
