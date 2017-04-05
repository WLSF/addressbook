class User < ApplicationRecord
  rolify

  include Authority::UserAbilities

  has_and_belongs_to_many :organizations

  validates :name, presence: true
  validates :email, presence: true
  validates :password, :password_confirmation, presence: true, length: {maximum: 20, minimum: 8}

  has_secure_password
end
