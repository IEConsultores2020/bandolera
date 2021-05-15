class Tenant < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :payments
  mount_uploader :leasing_contract, LeasingContractUploader
end
