class HomeOwnerAdministrator < ActiveRecord::Base
  has_many :properties
  validates :name, presence: true # Make sure the owner's name is present.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true,
                    uniqueness: { case_sensitive: false }
end
