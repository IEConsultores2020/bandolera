class Payment < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :payment_method
end
